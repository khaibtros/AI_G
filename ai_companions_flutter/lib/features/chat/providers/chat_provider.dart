// Chat Provider - Riverpod state management

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/chat_service.dart';
import '../../../shared/models/index.dart';

class ChatState {
  final List<Conversation> conversations;
  final Conversation? activeConversation;
  final List<Message> messages;
  final bool isLoading;
  final bool isSending;
  final bool isLoadingConversations;
  final String streamingContent;
  final bool isStreaming;
  final bool isSendingGift;

  ChatState({
    this.conversations = const [],
    this.activeConversation,
    this.messages = const [],
    this.isLoading = false,
    this.isSending = false,
    this.isLoadingConversations = false,
    this.streamingContent = '',
    this.isStreaming = false,
    this.isSendingGift = false,
  });

  ChatState copyWith({
    List<Conversation>? conversations,
    Conversation? activeConversation,
    List<Message>? messages,
    bool? isLoading,
    bool? isSending,
    bool? isLoadingConversations,
    String? streamingContent,
    bool? isStreaming,
    bool? isSendingGift,
  }) {
    return ChatState(
      conversations: conversations ?? this.conversations,
      activeConversation: activeConversation ?? this.activeConversation,
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      isSending: isSending ?? this.isSending,
      isLoadingConversations:
          isLoadingConversations ?? this.isLoadingConversations,
      streamingContent: streamingContent ?? this.streamingContent,
      isStreaming: isStreaming ?? this.isStreaming,
      isSendingGift: isSendingGift ?? this.isSendingGift,
    );
  }
}

class ChatNotifier extends Notifier<ChatState> {
  @override
  ChatState build() => ChatState();

  Future<void> fetchConversations() async {
    state = state.copyWith(isLoadingConversations: true);
    try {
      final data = await ChatService.instance.listConversations();
      state = state.copyWith(
        conversations: data,
        isLoadingConversations: false,
      );
    } catch (e) {
      state = state.copyWith(isLoadingConversations: false);
      rethrow;
    }
  }

  Future<Conversation> startConversation(String characterId) async {
    state = state.copyWith(isLoading: true);
    try {
      final conversation = await ChatService.instance.createConversation(
        characterId,
      );
      final data = await ChatService.instance.getConversation(conversation.id);
      state = state.copyWith(
        activeConversation: data.conversation,
        messages: data.messages,
        isLoading: false,
      );
      return conversation;
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> loadConversation(String conversationId) async {
    state = state.copyWith(isLoading: true);
    try {
      final data = await ChatService.instance.getConversation(conversationId);
      state = state.copyWith(
        activeConversation: data.conversation,
        messages: data.messages,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> sendMessage(String content) async {
    if (state.activeConversation == null || state.isSending) return;

    final tempUserMsg = Message(
      id: 'temp-${DateTime.now().millisecondsSinceEpoch}',
      conversationId: state.activeConversation!.id,
      senderType: SenderType.user,
      characterId: null,
      content: content,
      mediaUrl: null,
      audioUrl: null,
      tokenCount: 0,
      createdAt: DateTime.now().toIso8601String(),
    );

    state = state.copyWith(
      messages: [...state.messages, tempUserMsg],
      isSending: true,
    );

    try {
      final result = await ChatService.instance.sendMessage(
        state.activeConversation!.id,
        content,
      );
      state = state.copyWith(
        messages: [
          ...state.messages.where((m) => m.id != tempUserMsg.id),
          result.userMessage,
          result.aiMessage,
        ],
        isSending: false,
      );
    } catch (e) {
      state = state.copyWith(
        messages: state.messages.where((m) => m.id != tempUserMsg.id).toList(),
        isSending: false,
      );
      rethrow;
    }
  }

  Future<void> sendStreamingMessage(String content) async {
    if (state.activeConversation == null ||
        state.isSending ||
        state.isStreaming)
      return;

    final tempUserMsg = Message(
      id: 'temp-${DateTime.now().millisecondsSinceEpoch}',
      conversationId: state.activeConversation!.id,
      senderType: SenderType.user,
      content: content,
      createdAt: DateTime.now().toIso8601String(),
    );

    state = state.copyWith(
      messages: [...state.messages, tempUserMsg],
      isSending: true,
      isStreaming: true,
      streamingContent: '',
    );

    try {
      await ChatService.instance.streamMessage(
        state.activeConversation!.id,
        content,
        onUserMessage: (msg) {
          state = state.copyWith(
            messages: state.messages
                .map((m) => m.id == tempUserMsg.id ? msg : m)
                .toList(),
          );
        },
        onToken: (token) {
          state = state.copyWith(
            streamingContent: state.streamingContent + token,
          );
        },
        onDone: (aiMessage) {
          state = state.copyWith(
            messages: [...state.messages, aiMessage],
            streamingContent: '',
            isStreaming: false,
            isSending: false,
          );
        },
        onError: (error) {
          state = state.copyWith(isStreaming: false, isSending: false);
        },
      );
    } catch (e) {
      state = state.copyWith(
        messages: state.messages.where((m) => m.id != tempUserMsg.id).toList(),
        streamingContent: '',
        isStreaming: false,
        isSending: false,
      );
      rethrow;
    }
  }

  Future<void> regenerateResponse() async {
    if (state.activeConversation == null) return;

    state = state.copyWith(isSending: true);
    try {
      final result = await ChatService.instance.regenerate(
        state.activeConversation!.id,
      );
      final msgs = [...state.messages];
      final lastAiIdx = msgs.indexWhere(
        (m) => m.senderType == SenderType.character,
      );
      if (lastAiIdx >= 0) {
        msgs[lastAiIdx] = result.aiMessage;
      } else {
        msgs.add(result.aiMessage);
      }
      state = state.copyWith(messages: msgs, isSending: false);
    } catch (e) {
      state = state.copyWith(isSending: false);
      rethrow;
    }
  }

  Future<void> deleteConversation(String id) async {
    try {
      await ChatService.instance.deleteConversation(id);
      state = state.copyWith(
        conversations: state.conversations.where((c) => c.id != id).toList(),
      );
    } catch (e) {
      // Silent fail
    }
  }

  Future<SendGiftResponse> sendGift(String giftId) async {
    if (state.activeConversation == null || state.isSendingGift) {
      throw Exception('No active conversation');
    }

    state = state.copyWith(isSendingGift: true);
    try {
      final result = await ChatService.instance.sendGift(
        state.activeConversation!.id,
        giftId,
      );
      state = state.copyWith(
        messages: [...state.messages, result.giftMessage, result.aiMessage],
        isSendingGift: false,
      );
      return result;
    } catch (e) {
      state = state.copyWith(isSendingGift: false);
      rethrow;
    }
  }

  Future<void> deleteMessage(String messageId) async {
    if (state.activeConversation == null) return;

    try {
      await ChatService.instance.deleteMessage(
        state.activeConversation!.id,
        messageId,
      );
      state = state.copyWith(
        messages: state.messages.where((m) => m.id != messageId).toList(),
      );
    } catch (e) {
      // Silent fail
    }
  }

  void clearActiveChat() {
    state = state.copyWith(
      activeConversation: null,
      messages: [],
      streamingContent: '',
      isStreaming: false,
    );
  }
}

final chatProvider = NotifierProvider<ChatNotifier, ChatState>(
  ChatNotifier.new,
);
