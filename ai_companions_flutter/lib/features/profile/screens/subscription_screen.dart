import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_border_radius.dart';
import '../../../core/constants/app_constants.dart';
import '../../../features/auth/providers/auth_provider.dart';
import '../../../features/premium/providers/premium_provider.dart';

const Map<String, List<Color>> _planGradientColors = {
  'free': [Color(0xFF1A1A2E), Color(0xFF1A1A2E)],
  'starter': [Color(0xFF1A4040), Color(0xFF0D3333)],
  'pro': [Color(0xFF2D1B69), Color(0xFF1A1040)],
  'ultimate': [Color(0xFF4A1942), Color(0xFF1A0D33)],
};

class SubscriptionScreen extends ConsumerWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user;
    final currentTier =
        user?.subscriptionTier.displayName.toLowerCase() ?? 'free';

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.base,
                vertical: AppSpacing.md,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.chevron_left,
                      color: AppColors.textPrimary,
                    ),
                    onPressed: () => context.pop(),
                  ),
                  const Spacer(),
                  const Text(
                    'Subscription',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 24),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.base),
                child: Column(
                  children: [
                    const Text(
                      'Choose Your Plan',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Unlock more features and enhance your experience',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    ...AppConstants.plans.entries.map((entry) {
                      final key = entry.key;
                      final plan = entry.value;
                      final isCurrentPlan = currentTier == key;
                      final gradientColors =
                          _planGradientColors[key] ??
                          [AppColors.surface, AppColors.surface];

                      return Container(
                        margin: const EdgeInsets.only(bottom: AppSpacing.md),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: AppBorderRadius.xl,
                            border: Border.all(
                              color: isCurrentPlan
                                  ? AppColors.primary
                                  : AppColors.cardBorder,
                              width: isCurrentPlan ? 2 : 1,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: AppBorderRadius.xl,
                            child: Container(
                              padding: const EdgeInsets.all(AppSpacing.lg),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: gradientColors,
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            plan.name,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.textPrimary,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            plan.price == 0
                                                ? 'Free'
                                                : '\$${plan.price.toStringAsFixed(2)}/mo',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.primaryLight,
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (isCurrentPlan)
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: AppSpacing.md,
                                            vertical: AppSpacing.xs,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryMuted,
                                            borderRadius: BorderRadius.circular(
                                              50,
                                            ),
                                          ),
                                          child: const Text(
                                            'Current',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.primaryLight,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: AppSpacing.lg),
                                  ...plan.features.map(
                                    (feature) => Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: AppSpacing.sm,
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.check_circle,
                                            size: 16,
                                            color: AppColors.success,
                                          ),
                                          const SizedBox(width: AppSpacing.sm),
                                          Expanded(
                                            child: Text(
                                              feature,
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: AppColors.textSecondary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (!isCurrentPlan && key != 'free')
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: AppSpacing.lg,
                                      ),
                                      child: GestureDetector(
                                        onTap: () async {
                                          try {
                                            await ref
                                                .read(premiumProvider.notifier)
                                                .subscribe(key);
                                            if (context.mounted) {
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    'Subscription active! Enjoy your new features.',
                                                  ),
                                                ),
                                              );
                                            }
                                          } catch (e) {
                                            if (context.mounted) {
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text('Error: $e'),
                                                ),
                                              );
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 46,
                                          decoration: BoxDecoration(
                                            borderRadius: AppBorderRadius.lg,
                                            gradient: AppColors.primaryGradient,
                                          ),
                                          child: Center(
                                            child: Text(
                                              currentTier == 'free'
                                                  ? 'Get Started'
                                                  : 'Upgrade',
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      'Payment integration coming soon. Plans are for display purposes.',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textMuted,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
