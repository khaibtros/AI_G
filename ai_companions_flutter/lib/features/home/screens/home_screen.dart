import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_border_radius.dart';
import '../../character/providers/character_provider.dart';
import '../../chat/providers/chat_provider.dart';
import '../../auth/providers/auth_provider.dart';
import '../../../shared/widgets/loading_widget.dart';
import '../../../shared/widgets/empty_state_widget.dart';
import '../../../core/config/app_config.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(characterProvider.notifier).fetchFeatured();
      ref.read(chatProvider.notifier).fetchConversations();
    });
  }

  Future<void> _onRefresh() async {
    await Future.wait([
      ref.read(characterProvider.notifier).fetchFeatured(),
      ref.read(chatProvider.notifier).fetchConversations(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    final characterState = ref.watch(characterProvider);
    final chatState = ref.watch(chatProvider);
    final recentChats = chatState.conversations.take(6).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: characterState.isLoading
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
                      Padding(
                        padding: const EdgeInsets.all(AppSpacing.base),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome back,',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                                Text(
                                  user?.displayName ?? user?.username ?? 'User',
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () => context.go('/profile'),
                              child: _buildAvatar(
                                user?.avatarUrl,
                                user?.displayName ?? 'U',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.base,
                        ),
                        child: GestureDetector(
                          onTap: () => context.push('/subscription'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.base,
                              vertical: AppSpacing.md,
                            ),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF1a1040), Color(0xFF2d1b69)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: AppBorderRadius.lg,
                              border: Border.all(
                                color: AppColors.primary.withOpacity(0.3),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: AppSpacing.sm,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary.withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        child: const Text(
                                          '✨ New Pro Tier',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: AppColors.primaryLight,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: AppSpacing.sm),
                                      const Text(
                                        'Unlock Unlimited Messages',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      const Text(
                                        'Chat as much as you want with no limits',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: AppColors.primaryLight,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.base,
                        ),
                        child: GestureDetector(
                          onTap: () => context.push('/character/create'),
                          child: Container(
                            height: 46,
                            decoration: BoxDecoration(
                              borderRadius: AppBorderRadius.lg,
                              gradient: AppColors.primaryGradient,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.auto_awesome, color: Colors.white, size: 18),
                                SizedBox(width: AppSpacing.sm),
                                Text(
                                  'Create New Companion',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      if (recentChats.isNotEmpty) ...[
                        Padding(
                          padding: const EdgeInsets.only(
                            left: AppSpacing.base,
                            right: AppSpacing.base,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Jump Back In',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => context.push('/chats'),
                                child: const Text(
                                  'View all',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.primaryLight,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        SizedBox(
                          height: 110,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(
                              left: AppSpacing.base,
                            ),
                            itemCount: recentChats.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: AppSpacing.xl),
                            itemBuilder: (context, index) {
                              final conv = recentChats[index];
                              final char = conv.character;
                              return GestureDetector(
                                onTap: () => context.push('/chat/${conv.id}'),
                                child: SizedBox(
                                  width: 72,
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          _buildRecentAvatar(
                                            char?.avatarUrl,
                                            char?.name ?? '?',
                                          ),
                                          Positioned(
                                            bottom: 2,
                                            right: 2,
                                            child: Container(
                                              width: 14,
                                              height: 14,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.online,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: AppSpacing.sm),
                                      Text(
                                        char?.name ?? 'Unknown',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.textPrimary,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        conv.lastMessagePreview ??
                                            'Start chatting...',
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: AppColors.textMuted,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xl),
                      ],
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.base,
                        ),
                        child: Text(
                          'Featured Personalities',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      if (characterState.featured.isEmpty)
                        const Padding(
                          padding: EdgeInsets.all(AppSpacing.base),
                          child: EmptyStateWidget(
                            message: 'No featured companions yet',
                            icon: Icons.star_border,
                          ),
                        )
                      else
                        ...characterState.featured.map(
                          (character) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.base,
                              vertical: AppSpacing.sm,
                            ),
                            child: GestureDetector(
                              onTap: () =>
                                  context.push('/character/${character.id}'),
                              child: ClipRRect(
                                borderRadius: AppBorderRadius.xlarge,
                                child: SizedBox(
                                  height: 220,
                                  child: Stack(
                                    children: [
                                      if (character.avatarUrl != null)
                                        Image.network(
                                          AppConfig.resolveImageUrl(character.avatarUrl!)!,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.topCenter,
                                          width: double.infinity,
                                          height: double.infinity,
                                          errorBuilder: (_, __, ___) =>
                                              Container(
                                                color: AppColors.surface,
                                              ),
                                        ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.transparent,
                                              Colors.black87,
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: AppSpacing.md,
                                        left: AppSpacing.md,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: AppSpacing.md,
                                            vertical: AppSpacing.xs,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(
                                              0.6,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: Text(
                                            character.categories.isNotEmpty
                                                ? character.categories.first
                                                : 'Popular',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.textPrimary,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: AppSpacing.base,
                                        left: AppSpacing.base,
                                        right: AppSpacing.base + 56,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              character.name,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.textPrimary,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              character.tagline ??
                                                  character.description ??
                                                  '',
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: AppColors.textSecondary,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: AppSpacing.base,
                                        right: AppSpacing.base,
                                        child: Container(
                                          width: 44,
                                          height: 44,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.primary,
                                          ),
                                          child: const Icon(
                                            Icons.chat_bubble_outline,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildAvatar(String? url, String fallback) {
    final resolvedUrl = AppConfig.resolveImageUrl(url);
    if (resolvedUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Image.network(
          resolvedUrl,
          width: 44,
          height: 44,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _defaultAvatar(fallback),
        ),
      );
    }
    return _defaultAvatar(fallback);
  }

  Widget _defaultAvatar(String fallback) {
    return Container(
      width: 44,
      height: 44,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
        ),
      ),
      child: Center(
        child: Text(
          fallback[0].toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildRecentAvatar(String? url, String fallback) {
    final resolvedUrl = AppConfig.resolveImageUrl(url);
    if (resolvedUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Image.network(
          resolvedUrl,
          width: 64,
          height: 64,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _defaultRecentAvatar(fallback),
        ),
      );
    }
    return _defaultRecentAvatar(fallback);
  }

  Widget _defaultRecentAvatar(String fallback) {
    return Container(
      width: 64,
      height: 64,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: [AppColors.primary, AppColors.accent]),
      ),
      child: Center(
        child: Text(
          fallback[0],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
