import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_border_radius.dart';
import '../../auth/providers/auth_provider.dart';
import '../../character/providers/character_provider.dart';
import '../../../shared/models/enums.dart';
import '../../../shared/models/profile.dart';
import '../../../shared/widgets/loading_widget.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authProvider.notifier).loadProfile();
      ref.read(characterProvider.notifier).fetchMyCharacters();
      ref.read(characterProvider.notifier).fetchFavorites();
    });
  }

  Future<void> _onRefresh() async {
    await Future.wait([
      ref.read(authProvider.notifier).loadProfile(),
      ref.read(characterProvider.notifier).fetchMyCharacters(),
      ref.read(characterProvider.notifier).fetchFavorites(),
    ]);
  }

  void _handleLogout() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text(
          'Sign Out',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        content: const Text(
          'Are you sure you want to sign out?',
          style: TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              ref.read(authProvider.notifier).logout();
            },
            child: const Text(
              'Sign Out',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final characterState = ref.watch(characterProvider);
    final user = authState.user;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: !authState.isAuthenticated || user == null
          ? const LoadingWidget()
          : SafeArea(
              child: RefreshIndicator(
                onRefresh: _onRefresh,
                color: AppColors.primary,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile Header
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          AppSpacing.base,
                          AppSpacing.lg,
                          AppSpacing.base,
                          AppSpacing.xl,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                _buildAvatar(user),
                                const SizedBox(width: AppSpacing.base),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        user.displayName ?? user.username ?? '',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        '@${user.username ?? ''}',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                      const SizedBox(height: AppSpacing.xs),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: AppSpacing.sm,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryMuted,
                                          borderRadius: AppBorderRadius.small,
                                        ),
                                        child: Text(
                                          user.subscriptionTier.name
                                              .toUpperCase(),
                                          style: const TextStyle(
                                            fontSize: 11,
                                            color: AppColors.primaryLight,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            if (user.bio != null && user.bio!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: AppSpacing.md,
                                ),
                                child: Text(
                                  user.bio!,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: AppColors.textSecondary,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),

                      // Stats Row
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.base,
                        ),
                        child: Row(
                          children: [
                            _buildStatCard(
                              icon: Icons.create_outlined,
                              value: characterState.myCharacters.length
                                  .toString(),
                              label: 'Created',
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            _buildStatCard(
                              icon: Icons.favorite_border,
                              value: characterState.favorites.length.toString(),
                              label: 'Favorites',
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            _buildStatCard(
                              icon: Icons.account_balance_wallet_outlined,
                              value: user.coinBalance.toString(),
                              label: 'Coins',
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: AppSpacing.xl),

                      // Upgrade Banner
                      if (user.subscriptionTier == SubscriptionTier.free)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.base,
                          ),
                          child: GestureDetector(
                            onTap: () => context.push('/subscription'),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.lg,
                                vertical: AppSpacing.base,
                              ),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    AppColors.ctaGradientStart,
                                    AppColors.ctaGradientEnd,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: AppBorderRadius.xl,
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.diamond_outlined,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  const SizedBox(width: AppSpacing.md),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Upgrade to Pro',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'Unlimited messages & memory',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      if (user.subscriptionTier == SubscriptionTier.free)
                        const SizedBox(height: AppSpacing.xl),

                      // Menu Section
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.base,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: AppBorderRadius.xl,
                          border: Border.all(color: AppColors.cardBorder),
                        ),
                        child: Column(
                          children: [
                            _buildMenuItem(
                              icon: Icons.person_outline,
                              label: 'Edit Profile',
                              onTap: () => context.push('/settings'),
                            ),
                            const Divider(
                              height: 1,
                              color: AppColors.divider,
                              indent: AppSpacing.base,
                              endIndent: AppSpacing.base,
                            ),
                            _buildMenuItem(
                              icon: Icons.create_outlined,
                              label: 'My Characters',
                              onTap: () =>
                                  context.push('/character/my-characters'),
                            ),
                            const Divider(
                              height: 1,
                              color: AppColors.divider,
                              indent: AppSpacing.base,
                              endIndent: AppSpacing.base,
                            ),
                            _buildMenuItem(
                              icon: Icons.favorite_border,
                              label: 'Favorites',
                              onTap: () => context.push('/character/favorites'),
                            ),
                            const Divider(
                              height: 1,
                              color: AppColors.divider,
                              indent: AppSpacing.base,
                              endIndent: AppSpacing.base,
                            ),
                            _buildMenuItem(
                              icon: Icons.credit_card_outlined,
                              label: 'Subscription',
                              onTap: () => context.push('/subscription'),
                            ),
                            const Divider(
                              height: 1,
                              color: AppColors.divider,
                              indent: AppSpacing.base,
                              endIndent: AppSpacing.base,
                            ),
                            _buildMenuItem(
                              icon: Icons.logout,
                              label: 'Sign Out',
                              onTap: _handleLogout,
                              danger: true,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: AppSpacing.xl * 2),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildAvatar(Profile user) {
    if (user.avatarUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(36),
        child: CachedNetworkImage(
          imageUrl: user.avatarUrl!,
          width: 72,
          height: 72,
          fit: BoxFit.cover,
          errorWidget: (_, __, ___) => _defaultAvatar(user),
        ),
      );
    }
    return _defaultAvatar(user);
  }

  Widget _defaultAvatar(Profile user) {
    return Container(
      width: 72,
      height: 72,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: [AppColors.primary, AppColors.accent]),
      ),
      child: Center(
        child: Text(
          (user.displayName ?? user.username ?? 'U')[0].toUpperCase(),
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: AppBorderRadius.large,
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Column(
          children: [
            Icon(icon, size: 20, color: AppColors.primary),
            const SizedBox(height: AppSpacing.xs),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool danger = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.base,
          vertical: AppSpacing.md + 2,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: danger ? AppColors.error : AppColors.textSecondary,
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: danger ? AppColors.error : AppColors.textPrimary,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 18,
              color: AppColors.textMuted,
            ),
          ],
        ),
      ),
    );
  }
}
