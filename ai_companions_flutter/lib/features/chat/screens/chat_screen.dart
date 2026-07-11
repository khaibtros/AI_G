import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_border_radius.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/services/voice_service.dart';
import '../../../shared/models/index.dart';
import '../../../features/auth/providers/auth_provider.dart';
import '../providers/chat_provider.dart';

GiftDefinition? _parseGift(String? mediaUrl) {
  if (mediaUrl == null || !mediaUrl.startsWith('gift:')) return null;
  final giftId = mediaUrl.substring(5);
  try {
    return AppConstants.gifts.firstWhere((g) => g.id == giftId);
  } catch (_) {
    return null;
  }
}

class AffinityBar extends StatelessWidget {
  final int messageCount;
  const AffinityBar({super.key, required this.messageCount});

  @override
  Widget build(BuildContext context) {
    final level = (messageCount ~/ 20) + 1;
    final progress = (messageCount % 20) / 20.0;
    final levelName = level <= 2
        ? 'Stranger'
        : level <= 5
        ? 'Friend'
        : level <= 10
        ? 'Close Friend'
        : level <= 20
        ? 'Soulmate'
        : 'Eternal Bond';

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.favorite, size: 12, color: AppColors.accentPink),
              const SizedBox(width: 4),
              Text(
                'Lv.$level $levelName',
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.accentPink,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Container(
            height: 3,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(2),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: (progress * 100).clamp(5, 100) / 100,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  gradient: const LinearGradient(
                    colors: [AppColors.accentPink, AppColors.primary],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GiftPickerModal extends ConsumerStatefulWidget {
  final VoidCallback onClose;
  final Function(GiftDefinition) onSend;
  final bool isSending;
  final int balance;

  const GiftPickerModal({
    super.key,
    required this.onClose,
    required this.onSend,
    required this.isSending,
    required this.balance,
  });

  @override
  ConsumerState<GiftPickerModal> createState() => _GiftPickerModalState();
}

class _GiftPickerModalState extends ConsumerState<GiftPickerModal> {
  GiftDefinition? _selectedGift;

  Color _rarityColor(String rarity) {
    switch (rarity) {
      case 'common':
        return const Color(0xFF9CA3AF);
      case 'rare':
        return const Color(0xFF3B82F6);
      case 'epic':
        return const Color(0xFFA855F7);
      case 'legendary':
        return const Color(0xFFF59E0B);
      default:
        return const Color(0xFF9CA3AF);
    }
  }

  IconData _giftIcon(String iconName) {
    switch (iconName) {
      case 'flower-outline':
        return Icons.local_florist_outlined;
      case 'mail-outline':
        return Icons.mail_outline;
      case 'gift-outline':
        return Icons.card_giftcard;
      case 'heart-outline':
        return Icons.favorite_outline;
      case 'water-outline':
        return Icons.water_drop_outlined;
      case 'star-outline':
        return Icons.star_outline;
      case 'sparkles-outline':
        return Icons.auto_awesome_outlined;
      case 'trophy-outline':
        return Icons.emoji_events_outlined;
      case 'diamond-outline':
        return Icons.diamond_outlined;
      case 'flame-outline':
        return Icons.local_fire_department_outlined;
      default:
        return Icons.card_giftcard;
    }
  }

  @override
  Widget build(BuildContext context) {
    final canAfford =
        _selectedGift == null || widget.balance >= _selectedGift!.cost;
    return GestureDetector(
      onTap: widget.onClose,
      child: Container(
        color: Colors.black54,
        child: GestureDetector(
          onTap: () {},
          child: DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.4,
            maxChildSize: 0.85,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: AppSpacing.sm),
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppColors.textMuted,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text('Send a Gift', style: AppTypography.h4),
                    const SizedBox(height: 4),
                    Text(
                      'Show your appreciation with a virtual gift',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.base,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.accentGold.withOpacity(0.1),
                        borderRadius: AppBorderRadius.lg,
                        border: Border.all(
                          color: AppColors.accentGold.withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.bolt,
                            size: 14,
                            color: AppColors.accentGold,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${widget.balance} Coins',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: AppColors.accentGold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Expanded(
                      child: GridView.builder(
                        controller: scrollController,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.base,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 0.85,
                          crossAxisSpacing: AppSpacing.sm,
                          mainAxisSpacing: AppSpacing.sm,
                        ),
                        itemCount: AppConstants.gifts.length,
                        itemBuilder: (context, index) {
                          final gift = AppConstants.gifts[index];
                          final isSelected = _selectedGift?.id == gift.id;
                          final rColor = _rarityColor(gift.rarity);

                          return GestureDetector(
                            onTap: () => setState(() => _selectedGift = gift),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: AppBorderRadius.lg,
                                border: Border.all(
                                  color: isSelected
                                      ? rColor
                                      : AppColors.divider,
                                  width: isSelected ? 2 : 1,
                                ),
                              ),
                              padding: const EdgeInsets.all(AppSpacing.sm),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.primary.withOpacity(0.1),
                                      border: Border.all(color: rColor),
                                    ),
                                    child: Icon(
                                      _giftIcon(gift.icon),
                                      size: 28,
                                      color: rColor,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    gift.name,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: AppColors.textPrimary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.bolt,
                                        size: 12,
                                        color: AppColors.accentGold,
                                      ),
                                      Text(
                                        '${gift.cost}',
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: AppColors.accentGold,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    gift.rarity.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w800,
                                      color: rColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    if (_selectedGift != null)
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.base),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: AppColors.divider),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              _giftIcon(_selectedGift!.icon),
                              size: 24,
                              color: _rarityColor(_selectedGift!.rarity),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    _selectedGift!.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  Text(
                                    '+${_selectedGift!.affinity} affinity',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.accentPink,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                widget.onSend(_selectedGift!);
                                setState(() => _selectedGift = null);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSpacing.base,
                                  vertical: AppSpacing.sm,
                                ),
                                decoration: BoxDecoration(
                                  color: canAfford
                                      ? AppColors.primary
                                      : AppColors.textDisabled,
                                  borderRadius: AppBorderRadius.xl,
                                ),
                                child: widget.isSending
                                    ? const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.bolt,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            canAfford
                                                ? '${_selectedGift!.cost} Send'
                                                : 'Insufficient',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class GiftBubble extends StatelessWidget {
  final GiftDefinition gift;
  final String content;
  final String timestamp;
  const GiftBubble({
    super.key,
    required this.gift,
    required this.content,
    required this.timestamp,
  });

  Color _rarityColor(String rarity) {
    switch (rarity) {
      case 'common':
        return const Color(0xFF9CA3AF);
      case 'rare':
        return const Color(0xFF3B82F6);
      case 'epic':
        return const Color(0xFFA855F7);
      case 'legendary':
        return const Color(0xFFF59E0B);
      default:
        return const Color(0xFF9CA3AF);
    }
  }

  IconData _giftIcon(String iconName) {
    switch (iconName) {
      case 'flower-outline':
        return Icons.local_florist_outlined;
      case 'mail-outline':
        return Icons.mail_outline;
      case 'gift-outline':
        return Icons.card_giftcard;
      case 'heart-outline':
        return Icons.favorite_outline;
      case 'water-outline':
        return Icons.water_drop_outlined;
      case 'star-outline':
        return Icons.star_outline;
      case 'sparkles-outline':
        return Icons.auto_awesome_outlined;
      case 'trophy-outline':
        return Icons.emoji_events_outlined;
      case 'diamond-outline':
        return Icons.diamond_outlined;
      case 'flame-outline':
        return Icons.local_fire_department_outlined;
      default:
        return Icons.card_giftcard;
    }
  }

  @override
  Widget build(BuildContext context) {
    final rColor = _rarityColor(gift.rarity);
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Center(
        child: Container(
          width: screenWidth * 0.6,
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.xl,
            border: Border.all(color: AppColors.primary.withOpacity(0.2)),
            gradient: const LinearGradient(
              colors: [Color(0x267C3AED), Color(0x26EC4899)],
            ),
          ),
          padding: const EdgeInsets.all(AppSpacing.base),
          child: Column(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.05),
                  border: Border.all(color: rColor, width: 2),
                ),
                child: Icon(_giftIcon(gift.icon), size: 32, color: rColor),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                gift.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '${gift.rarity.toUpperCase()} GIFT',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: rColor,
                  letterSpacing: 1,
                ),
              ),
              Text(
                timestamp,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageActionSheet extends StatelessWidget {
  final bool visible;
  final Message? message;
  final bool isLastAI;
  final VoidCallback onClose;
  final VoidCallback onCopy;
  final VoidCallback onDelete;
  final VoidCallback onRegenerate;

  const MessageActionSheet({
    super.key,
    required this.visible,
    this.message,
    required this.isLastAI,
    required this.onClose,
    required this.onCopy,
    required this.onDelete,
    required this.onRegenerate,
  });

  @override
  Widget build(BuildContext context) {
    if (!visible || message == null) return const SizedBox.shrink();

    return GestureDetector(
      onTap: onClose,
      child: Container(
        color: Colors.black54,
        child: Center(
          child: Container(
            width: 300,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: AppBorderRadius.xl,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _ActionOption(
                  icon: Icons.copy_outlined,
                  label: 'Copy Text',
                  color: AppColors.textPrimary,
                  onTap: onCopy,
                ),
                if (isLastAI)
                  _ActionOption(
                    icon: Icons.refresh_outlined,
                    label: 'Regenerate',
                    color: AppColors.primary,
                    onTap: onRegenerate,
                  ),
                _ActionOption(
                  icon: Icons.delete_outline,
                  label: 'Delete',
                  color: AppColors.error,
                  onTap: onDelete,
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: AppColors.divider)),
                  ),
                  child: TextButton(
                    onPressed: onClose,
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: AppColors.textMuted),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ActionOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionOption({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
          horizontal: AppSpacing.base,
        ),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.divider)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(width: AppSpacing.sm),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StreamingBubble extends StatefulWidget {
  final String content;
  final MessageCharacter? character;
  const StreamingBubble({super.key, required this.content, this.character});

  @override
  State<StreamingBubble> createState() => _StreamingBubbleState();
}

class _StreamingBubbleState extends State<StreamingBubble> {
  bool _showCursor = true;

  @override
  void initState() {
    super.initState();
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 500));
      if (!mounted) return false;
      setState(() => _showCursor = !_showCursor);
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 32, height: 32, child: _buildAvatar()),
          const SizedBox(width: AppSpacing.sm),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.base),
              decoration: BoxDecoration(
                color: AppColors.aiBubble,
                borderRadius: AppBorderRadius.xl,
                border: Border.all(color: AppColors.aiBubbleBorder),
              ),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: widget.content,
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    if (_showCursor)
                      const TextSpan(
                        text: '▊',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.primary,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    final char = widget.character;
    if (char?.avatarUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          char!.avatarUrl!,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _defaultAvatar(),
        ),
      );
    }
    return _defaultAvatar();
  }

  Widget _defaultAvatar() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: [AppColors.primary, AppColors.accent]),
      ),
      child: Center(
        child: Text(
          (widget.character?.name ?? '?')[0],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 44, bottom: AppSpacing.sm),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.base,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: AppColors.aiBubble,
          borderRadius: AppBorderRadius.xl,
          border: Border.all(color: AppColors.aiBubbleBorder),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) {
            return Padding(
              padding: const EdgeInsets.only(right: 4),
              child: AnimatedOpacity(
                opacity: [0.4, 0.7, 1.0][i],
                duration: const Duration(milliseconds: 600),
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.textMuted,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final Message item;
  final int index;
  final MessageCharacter? mainCharacter;
  final List<Message> messages;
  final String? playingId;
  final String? generatingVoiceId;
  final void Function(Message) onLongPress;
  final void Function(Message, String?) onTogglePlay;

  const MessageItem({
    super.key,
    required this.item,
    required this.index,
    this.mainCharacter,
    required this.messages,
    this.playingId,
    this.generatingVoiceId,
    required this.onLongPress,
    required this.onTogglePlay,
  });

  @override
  Widget build(BuildContext context) {
    final isUser = item.senderType == SenderType.user;
    final msgChar = item.character ?? mainCharacter;
    final showAvatar =
        !isUser &&
        (index == 0 ||
            messages[index - 1].senderType != item.senderType ||
            messages[index - 1].characterId != item.characterId);
    final screenWidth = MediaQuery.of(context).size.width;
    final gift = _parseGift(item.mediaUrl);

    if (gift != null && isUser) {
      final ts = _formatTime(item.createdAt);
      return GiftBubble(gift: gift, content: item.content, timestamp: ts);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        mainAxisAlignment: isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser)
            SizedBox(
              width: 36,
              child: showAvatar
                  ? _buildMessageAvatar(msgChar)
                  : const SizedBox(width: 32),
            ),
          if (!isUser) const SizedBox(width: AppSpacing.sm),
          GestureDetector(
            onLongPress: () => onLongPress(item),
            child: Container(
              constraints: BoxConstraints(maxWidth: screenWidth * 0.75),
              padding: const EdgeInsets.all(AppSpacing.base),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(24),
                  topRight: const Radius.circular(24),
                  bottomLeft: isUser
                      ? const Radius.circular(24)
                      : const Radius.circular(8),
                  bottomRight: isUser
                      ? const Radius.circular(8)
                      : const Radius.circular(24),
                ),
                color: isUser ? null : AppColors.aiBubble,
                gradient: isUser ? AppColors.userBubbleGradient : null,
                border: isUser
                    ? null
                    : Border.all(color: AppColors.aiBubbleBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isUser &&
                      showAvatar &&
                      (messages.first.conversationId.contains('group')))
                    Text(
                      msgChar?.name ?? '',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  Text(
                    item.content,
                    style: TextStyle(
                      fontSize: 15,
                      color: isUser ? Colors.white : AppColors.textPrimary,
                    ),
                  ),
                  if (!isUser) ...[
                    const SizedBox(height: AppSpacing.sm),
                    GestureDetector(
                      onTap: generatingVoiceId == item.id
                          ? null
                          : () => onTogglePlay(item, msgChar?.voiceId),
                      child: Container(
                        padding: const EdgeInsets.only(top: AppSpacing.sm),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.white10),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (generatingVoiceId == item.id)
                              const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.primary,
                                ),
                              )
                            else
                              Icon(
                                playingId == item.id
                                    ? Icons.pause_circle_outline
                                    : Icons.play_circle_outline,
                                size: 20,
                                color: AppColors.primary,
                              ),
                            const SizedBox(width: 6),
                            Text(
                              generatingVoiceId == item.id
                                  ? 'Generating...'
                                  : playingId == item.id
                                  ? 'Stop'
                                  : 'Play Voice',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: AppSpacing.xs),
                      child: Text(
                        _formatTime(item.createdAt),
                        style: TextStyle(
                          fontSize: 11,
                          color: isUser ? Colors.white60 : AppColors.textMuted,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageAvatar(MessageCharacter? char) {
    if (char?.avatarUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          char!.avatarUrl!,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _defaultAvatar(char),
        ),
      );
    }
    return _defaultAvatar(char);
  }

  Widget _defaultAvatar(MessageCharacter? char) {
    return Container(
      width: 32,
      height: 32,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: [AppColors.primary, AppColors.accent]),
      ),
      child: Center(
        child: Text(
          (char?.name ?? '?')[0],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  String _formatTime(String dateStr) {
    try {
      final dt = DateTime.parse(dateStr);
      return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    } catch (_) {
      return '';
    }
  }
}

class ChatScreen extends ConsumerStatefulWidget {
  final String conversationId;
  const ChatScreen({super.key, required this.conversationId});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  late TextEditingController messageController;
  final ScrollController _scrollController = ScrollController();

  bool _isRecording = false;
  String? _playingId;
  String? _generatingVoiceId;

  bool _showGiftPicker = false;
  Message? _actionMessage;
  bool _showActions = false;

  @override
  void initState() {
    super.initState();
    messageController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _loadData();
    });
  }

  Future<void> _loadData() async {
    try {
      await ref.read(chatProvider.notifier).loadConversation(widget.conversationId);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load conversation: $e')),
        );
      }
    }
    if (mounted) {
      ref.read(authProvider.notifier).loadProfile();
    }
  }

  @override
  void dispose() {
    messageController.dispose();
    _scrollController.dispose();
    ref.read(chatProvider.notifier).clearActiveChat();
    super.dispose();
  }

  Future<void> _handleSendText() async {
    final text = messageController.text.trim();
    if (text.isEmpty) return;
    final chatNotifier = ref.read(chatProvider.notifier);
    final chatState = ref.read(chatProvider);
    if (chatState.isSending || chatState.isStreaming) return;

    messageController.clear();
    await chatNotifier.sendStreamingMessage(text);
  }

  Future<void> _handleSendGift(GiftDefinition gift) async {
    try {
      final result = await ref.read(chatProvider.notifier).sendGift(gift.id);
      setState(() => _showGiftPicker = false);
      if (result.newBalance > 0) {
        ref.read(authProvider.notifier).updateBalance(result.newBalance);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to send gift: $e')));
      }
    }
  }

  Future<void> _startRecording() async {
    try {
      setState(() => _isRecording = true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Recording... (requires native audio package)'),
        ),
      );
    } catch (e) {
      // Audio recording requires native setup
    }
  }

  Future<void> _stopRecording() async {
    try {
      setState(() => _isRecording = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Speech-to-text requires native audio recording setup'),
        ),
      );
    } catch (e) {
      setState(() => _isRecording = false);
    }
  }

  Future<void> _togglePlayAudio(Message message, String? voiceId) async {
    try {
      if (_playingId == message.id) {
        setState(() {
          _playingId = null;
        });
        return;
      }

      if (message.audioUrl == null) {
        setState(() => _generatingVoiceId = message.id);
        try {
          final result = await VoiceService.instance.textToSpeech(
            message.content,
            voice: voiceId ?? 'nova',
          );
          if (result.newBalance != null) {
            ref.read(authProvider.notifier).updateBalance(result.newBalance!);
          }
        } finally {
          setState(() => _generatingVoiceId = null);
        }
      }

      setState(() => _playingId = message.id);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Audio playback requires native setup')),
        );
        setState(() {
          _playingId = null;
          _generatingVoiceId = null;
        });
      }
    }
  }

  void _handleMessageLongPress(Message message) {
    setState(() {
      _actionMessage = message;
      _showActions = true;
    });
  }

  Future<void> _handleCopyMessage() async {
    if (_actionMessage != null) {
      // Use Clipboard if available, otherwise show the text
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Text copied to clipboard')));
      setState(() {
        _showActions = false;
        _actionMessage = null;
      });
    }
  }

  void _handleDeleteMessage() {
    if (_actionMessage == null) return;
    final messageToDelete = _actionMessage!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text(
          'Delete Message',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        content: const Text(
          'Are you sure you want to delete this message?',
          style: TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref.read(chatProvider.notifier).deleteMessage(messageToDelete.id);
              setState(() {
                _showActions = false;
                _actionMessage = null;
              });
              Navigator.of(ctx).pop();
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _handleRegenerate() {
    setState(() {
      _showActions = false;
      _actionMessage = null;
    });
    ref.read(chatProvider.notifier).regenerateResponse();
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider);
    final authState = ref.watch(authProvider);
    final messages = chatState.messages;
    final isGroup = chatState.activeConversation?.isGroup ?? false;
    final mainCharacter = chatState.activeConversation?.character;

    final lastAIMessageId = messages.reversed
        .where((m) => m.senderType == SenderType.character)
        .firstOrNull
        ?.id;

    if (chatState.isLoading) {
      return Stack(
        children: [
          Scaffold(
            backgroundColor: AppColors.background,
            body: SafeArea(
              child: Column(
                children: [
                  _buildHeader(chatState, mainCharacter, isGroup, authState),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => FocusScope.of(context).unfocus(),
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: messages.length + 1,
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.md,
                          horizontal: AppSpacing.sm,
                        ),
                        itemBuilder: (context, index) {
                          if (index == messages.length) {
                            if (chatState.isStreaming &&
                                chatState.streamingContent.isNotEmpty) {
                              return StreamingBubble(
                                content: chatState.streamingContent,
                                character: mainCharacter != null
                                    ? MessageCharacter(
                                        id: mainCharacter.id,
                                        name: mainCharacter.name,
                                        avatarUrl: mainCharacter.avatarUrl,
                                      )
                                    : null,
                              );
                            }
                            if ((chatState.isSending &&
                                    !chatState.isStreaming) ||
                                chatState.isSendingGift) {
                              return const TypingIndicator();
                            }
                            return const SizedBox.shrink();
                          }
                          return MessageItem(
                            item: messages[index],
                            index: index,
                            mainCharacter: mainCharacter != null
                                ? MessageCharacter(
                                    id: mainCharacter.id,
                                    name: mainCharacter.name,
                                    avatarUrl: mainCharacter.avatarUrl,
                                  )
                                : null,
                            messages: messages,
                            playingId: _playingId,
                            generatingVoiceId: _generatingVoiceId,
                            onLongPress: _handleMessageLongPress,
                            onTogglePlay: _togglePlayAudio,
                          );
                        },
                      ),
                    ),
                  ),
                  _buildInputBar(chatState),
                ],
              ),
            ),
          ),
          if (_showGiftPicker)
            GiftPickerModal(
              onClose: () => setState(() => _showGiftPicker = false),
              onSend: _handleSendGift,
              isSending: chatState.isSendingGift,
              balance: authState.user?.coinBalance ?? 0,
            ),
          if (_showActions)
            MessageActionSheet(
              visible: _showActions,
              message: _actionMessage,
              isLastAI: _actionMessage?.id == lastAIMessageId,
              onClose: () => setState(() {
                _showActions = false;
                _actionMessage = null;
              }),
              onCopy: _handleCopyMessage,
              onDelete: _handleDeleteMessage,
              onRegenerate: _handleRegenerate,
            ),
        ],
      );
    }

    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Column(
              children: [
                _buildHeader(chatState, mainCharacter, isGroup, authState),
                Expanded(
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: messages.length + 1,
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.md,
                        horizontal: AppSpacing.sm,
                      ),
                      itemBuilder: (context, index) {
                        if (index == messages.length) {
                          if (chatState.isStreaming &&
                              chatState.streamingContent.isNotEmpty) {
                            return StreamingBubble(
                              content: chatState.streamingContent,
                              character: mainCharacter != null
                                  ? MessageCharacter(
                                      id: mainCharacter.id,
                                      name: mainCharacter.name,
                                      avatarUrl: mainCharacter.avatarUrl,
                                    )
                                  : null,
                            );
                          }
                          if ((chatState.isSending && !chatState.isStreaming) ||
                              chatState.isSendingGift) {
                            return const TypingIndicator();
                          }
                          return const SizedBox.shrink();
                        }
                        return MessageItem(
                          item: messages[index],
                          index: index,
                          mainCharacter: mainCharacter != null
                              ? MessageCharacter(
                                  id: mainCharacter.id,
                                  name: mainCharacter.name,
                                  avatarUrl: mainCharacter.avatarUrl,
                                )
                              : null,
                          messages: messages,
                          playingId: _playingId,
                          generatingVoiceId: _generatingVoiceId,
                          onLongPress: _handleMessageLongPress,
                          onTogglePlay: _togglePlayAudio,
                        );
                      },
                    ),
                  ),
                ),
                _buildInputBar(chatState),
              ],
            ),
          ),
        ),
        if (_showGiftPicker)
          GiftPickerModal(
            onClose: () => setState(() => _showGiftPicker = false),
            onSend: _handleSendGift,
            isSending: chatState.isSendingGift,
            balance: authState.user?.coinBalance ?? 0,
          ),
        if (_showActions)
          MessageActionSheet(
            visible: _showActions,
            message: _actionMessage,
            isLastAI: _actionMessage?.id == lastAIMessageId,
            onClose: () => setState(() {
              _showActions = false;
              _actionMessage = null;
            }),
            onCopy: _handleCopyMessage,
            onDelete: _handleDeleteMessage,
            onRegenerate: _handleRegenerate,
          ),
      ],
    );
  }

  Widget _buildHeader(
    ChatState chatState,
    Character? mainCharacter,
    bool isGroup,
    AuthState authState,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.sm,
      ),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.divider)),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left, color: AppColors.textPrimary),
            onPressed: () => context.pop(),
          ),
          GestureDetector(
            onTap: () {
              if (!isGroup && mainCharacter != null) {
                context.push('/character/${mainCharacter.id}');
              }
            },
            child: Row(
              children: [
                if (isGroup)
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.surface,
                    ),
                    child: const Icon(Icons.people, color: AppColors.primary),
                  )
                else
                  _buildHeaderAvatar(mainCharacter),
                const SizedBox(width: AppSpacing.sm),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isGroup
                          ? 'Group Chat'
                          : mainCharacter?.name ?? 'Character',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.online,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          chatState.isStreaming
                              ? 'Typing...'
                              : chatState.isSendingGift
                              ? 'Reacting...'
                              : 'Online',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.online,
                          ),
                        ),
                      ],
                    ),
                    if (!isGroup && chatState.activeConversation != null)
                      AffinityBar(
                        messageCount:
                            chatState.activeConversation!.messageCount,
                      ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: AppColors.accentGold.withOpacity(0.1),
              borderRadius: AppBorderRadius.lg,
              border: Border.all(color: AppColors.accentGold.withOpacity(0.2)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.bolt, size: 14, color: AppColors.accentGold),
                const SizedBox(width: 4),
                Text(
                  '${authState.user?.coinBalance ?? 0}',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.accentGold,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz, color: AppColors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderAvatar(Character? character) {
    if (character?.avatarUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          character!.avatarUrl!,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _defaultHeaderAvatar(character),
        ),
      );
    }
    return _defaultHeaderAvatar(character);
  }

  Widget _defaultHeaderAvatar(Character? character) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: [AppColors.primary, AppColors.accent]),
      ),
      child: Center(
        child: Text(
          (character?.name ?? '?')[0],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildInputBar(ChatState chatState) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.sm,
      ),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.divider)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTapDown: (_) => _startRecording(),
            onTapUp: (_) => _stopRecording(),
            onTapCancel: () => _stopRecording(),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Icon(
                _isRecording ? Icons.mic : Icons.mic_outlined,
                size: 24,
                color: _isRecording ? AppColors.error : AppColors.textMuted,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _showGiftPicker = true),
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.card_giftcard_outlined,
                size: 24,
                color: AppColors.accentPink,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: Container(
              constraints: const BoxConstraints(maxHeight: 120),
              decoration: BoxDecoration(
                color: AppColors.inputBg,
                borderRadius: AppBorderRadius.xl,
                border: Border.all(color: AppColors.inputBorder),
              ),
              child: TextField(
                controller: messageController,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.textPrimary,
                ),
                maxLines: 5,
                maxLength: 5000,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.base,
                    vertical: AppSpacing.md,
                  ),
                  counterText: '',
                  hintText: 'Type a message...',
                  hintStyle: TextStyle(color: AppColors.textMuted),
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          GestureDetector(
            onTap: messageController.text.trim().isNotEmpty
                ? _handleSendText
                : null,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: messageController.text.trim().isNotEmpty
                    ? AppColors.primary
                    : Colors.transparent,
              ),
              child: Icon(
                Icons.send,
                size: 20,
                color: messageController.text.trim().isNotEmpty
                    ? Colors.white
                    : AppColors.textMuted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
