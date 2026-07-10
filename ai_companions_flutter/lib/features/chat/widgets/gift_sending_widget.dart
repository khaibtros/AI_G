// Gift Sending Widget - A bottom sheet for sending gifts to characters

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/constants/app_constants.dart';
import '../providers/chat_provider.dart';

class GiftSendingWidget extends ConsumerWidget {
  const GiftSendingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.base),
            child: Text('Send a Gift', style: AppTypography.h4),
          ),
          GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(AppSpacing.base),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: AppSpacing.base,
              mainAxisSpacing: AppSpacing.base,
            ),
            itemCount: AppConstants.gifts.length,
            itemBuilder: (context, index) {
              final gift = AppConstants.gifts[index];
              return GestureDetector(
                onTap: () async {
                  await ref.read(chatProvider.notifier).sendGift(gift.id);
                  Navigator.of(context).pop();
                },
                child: Column(
                  children: [
                    Icon(Icons.card_giftcard, size: 32),
                    SizedBox(height: AppSpacing.sm),
                    Text(
                      gift.name,
                      style: AppTypography.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${gift.cost} Coins',
                      style: AppTypography.caption.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
