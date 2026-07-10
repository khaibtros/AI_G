// UI Provider - Global UI state management

import 'package:flutter_riverpod/flutter_riverpod.dart';

class UIState {
  final bool isGlobalLoading;
  final String? toastMessage;
  final String toastType;

  UIState({
    this.isGlobalLoading = false,
    this.toastMessage,
    this.toastType = 'info',
  });

  UIState copyWith({
    bool? isGlobalLoading,
    String? toastMessage,
    String? toastType,
  }) {
    return UIState(
      isGlobalLoading: isGlobalLoading ?? this.isGlobalLoading,
      toastMessage: toastMessage ?? this.toastMessage,
      toastType: toastType ?? this.toastType,
    );
  }
}

class UINotifier extends Notifier<UIState> {
  @override
  UIState build() => UIState();

  void setGlobalLoading(bool loading) {
    state = state.copyWith(isGlobalLoading: loading);
  }

  void showToast(String message, {String type = 'info'}) {
    state = state.copyWith(toastMessage: message, toastType: type);
    Future.delayed(const Duration(seconds: 3), () {
      if (state.toastMessage == message) {
        state = state.copyWith(toastMessage: null);
      }
    });
  }

  void hideToast() {
    state = state.copyWith(toastMessage: null);
  }
}

final uiProvider = NotifierProvider<UINotifier, UIState>(UINotifier.new);
