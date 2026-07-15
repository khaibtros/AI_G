import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_border_radius.dart';
import '../../auth/providers/auth_provider.dart';
import '../providers/admin_provider.dart';
import '../../../shared/models/profile.dart';
import '../../../shared/models/character.dart';
import '../../../shared/models/enums.dart';
import '../../../core/config/app_config.dart';

class AdminDashboardScreen extends ConsumerStatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  ConsumerState<AdminDashboardScreen> createState() =>
      _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends ConsumerState<AdminDashboardScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(adminProvider.notifier).fetchStats();
      ref.read(adminProvider.notifier).fetchRecentActivity();
    });
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(ctx).pop();
              await ref.read(authProvider.notifier).logout();
              if (context.mounted) context.go('/login');
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adminProvider);
    final currentNavIndex = state.currentAdminNavIndex;
    final pages = [
      _DashboardOverview(state: state),
      const _AdminUsersTab(),
      const _AdminCharactersTab(),
      const _AdminSubscriptionsTab(),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          ['Dashboard', 'Users', 'Characters', 'Subscriptions'][currentNavIndex],
          style: AppTypography.h3,
        ),
        backgroundColor: AppColors.background,
        elevation: 0,

        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: AppColors.textSecondary),
            onPressed: () {
              ref.read(adminProvider.notifier).fetchStats();
              ref.read(adminProvider.notifier).fetchRecentActivity();
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: AppColors.error),
            onPressed: () => _showLogoutDialog(context),
          ),
        ],
      ),
      body: pages[currentNavIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentNavIndex,
        onDestinationSelected: (index) {
          ref.read(adminProvider.notifier).setAdminNavIndex(index);
          if (index == 1) {
            ref.read(adminProvider.notifier).fetchUsers();
          } else if (index == 2) {
            ref.read(adminProvider.notifier).fetchCharacters();
          } else if (index == 3) {
            ref.read(adminProvider.notifier).fetchSubscriptions();
          }
        },
        backgroundColor: AppColors.surface,
        indicatorColor: AppColors.primaryMuted,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard, color: AppColors.primary),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people, color: AppColors.primary),
            label: 'Users',
          ),
          NavigationDestination(
            icon: Icon(Icons.auto_fix_high_outlined),
            selectedIcon: Icon(Icons.auto_fix_high, color: AppColors.primary),
            label: 'Characters',
          ),
          NavigationDestination(
            icon: Icon(Icons.card_membership_outlined),
            selectedIcon: Icon(Icons.card_membership, color: AppColors.primary),
            label: 'Subscriptions',
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// Dashboard Overview Tab
// ═══════════════════════════════════════════════════════════════
class _DashboardOverview extends StatelessWidget {
  final AdminState state;

  const _DashboardOverview({required this.state});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        final notifier = ProviderScope.containerOf(context).read(adminProvider.notifier);
        await notifier.fetchStats();
        await notifier.fetchRecentActivity();
      },
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.base),
        children: [
          // ── Stats Grid ───────────────────────────────────────
          Text(
            'System Overview',
            style: AppTypography.h3.copyWith(color: AppColors.textPrimary),
          ),
          SizedBox(height: AppSpacing.base),
          _StatsGrid(stats: state.stats),
          SizedBox(height: AppSpacing.xl),

          // ── Revenue Card ─────────────────────────────────────
          _RevenueCard(stats: state.stats),
          SizedBox(height: AppSpacing.xl),

          // ── Subscription Tier Breakdown ──────────────────────
          _TierBreakdownCard(tierBreakdown: state.stats.tierBreakdown),
          SizedBox(height: AppSpacing.xl),

          // ── Quick Actions ────────────────────────────────────
          Text(
            'Quick Actions',
            style: AppTypography.h3.copyWith(color: AppColors.textPrimary),
          ),
          SizedBox(height: AppSpacing.base),
          _QuickActionsGrid(),
          SizedBox(height: AppSpacing.xl),

          // ── Recent Activity ──────────────────────────────────
          Text(
            'Recent Activity',
            style: AppTypography.h3.copyWith(color: AppColors.textPrimary),
          ),
          SizedBox(height: AppSpacing.base),
          _RecentActivitySection(activity: state.recentActivity),
          SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }
}

// ── Stats Grid ─────────────────────────────────────────────────
class _StatsGrid extends StatelessWidget {
  final AdminStats stats;

  const _StatsGrid({required this.stats});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: AppSpacing.md,
      crossAxisSpacing: AppSpacing.md,
      childAspectRatio: 1.6,
      children: [
        _StatGradientCard(
          title: 'Total Users',
          value: '${stats.totalUsers}',
          icon: Icons.people,
          colors: const [Color(0xFF4facfe), Color(0xFF00f2fe)],
        ),
        _StatGradientCard(
          title: 'Characters',
          value: '${stats.totalCharacters}',
          icon: Icons.auto_fix_high,
          colors: const [Color(0xFFff0844), Color(0xFFffb199)],
        ),
        _StatGradientCard(
          title: 'Conversations',
          value: '${stats.totalConversations}',
          icon: Icons.chat_bubble,
          colors: const [Color(0xFFa18cd1), Color(0xFFfbc2eb)],
        ),
        _StatGradientCard(
          title: 'Messages',
          value: _formatNumber(stats.totalMessages),
          icon: Icons.message,
          colors: const [Color(0xFF667eea), Color(0xFF764ba2)],
        ),
        _StatGradientCard(
          title: 'Active Subs',
          value: '${stats.activeSubscriptions}',
          icon: Icons.star,
          colors: const [Color(0xFFf093fb), Color(0xFFf5576c)],
        ),
        _StatGradientCard(
          title: 'New This Week',
          value: '${stats.newUsersThisWeek}',
          icon: Icons.person_add,
          colors: const [Color(0xFF4facfe), Color(0xFF00f2fe)],
        ),
      ],
    );
  }

  String _formatNumber(int number) {
    if (number >= 1000000) return '${(number / 1000000).toStringAsFixed(1)}M';
    if (number >= 1000) return '${(number / 1000).toStringAsFixed(1)}K';
    return '$number';
  }
}

// ── Stat Gradient Card ─────────────────────────────────────────
class _StatGradientCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final List<Color> colors;

  const _StatGradientCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.lg,
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: colors.last.withAlpha(77),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, size: 24, color: Colors.white.withAlpha(204)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: AppTypography.h2.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                title,
                style: AppTypography.caption.copyWith(
                  color: Colors.white.withAlpha(217),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Revenue Card ───────────────────────────────────────────────
class _RevenueCard extends StatelessWidget {
  final AdminStats stats;

  const _RevenueCard({required this.stats});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.lg,
        gradient: const LinearGradient(
          colors: [Color(0xFF11998e), Color(0xFF38ef7d)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF38ef7d).withAlpha(77),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Estimated Monthly Revenue',
                style: AppTypography.bodySmall.copyWith(
                  color: Colors.white.withAlpha(230),
                ),
              ),
              SizedBox(height: AppSpacing.xs),
              Text(
                '\$${stats.estimatedRevenue.toStringAsFixed(2)}',
                style: AppTypography.h1.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppSpacing.xs),
              Text(
                '${stats.activeSubscriptions} active subscribers',
                style: AppTypography.caption.copyWith(
                  color: Colors.white.withAlpha(204),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(51),
              borderRadius: AppBorderRadius.md,
            ),
            child: const Icon(
              Icons.attach_money,
              size: 32,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Tier Breakdown Card ────────────────────────────────────────
class _TierBreakdownCard extends StatelessWidget {
  final Map<String, int> tierBreakdown;

  const _TierBreakdownCard({required this.tierBreakdown});

  @override
  Widget build(BuildContext context) {
    final total = tierBreakdown.values.fold<int>(0, (sum, v) => sum + v);
    final tierData = [
      ('Free', tierBreakdown['free'] ?? 0, AppColors.textMuted),
      ('Starter', tierBreakdown['starter'] ?? 0, AppColors.accentCyan),
      ('Pro', tierBreakdown['pro'] ?? 0, AppColors.accentGold),
      ('Ultimate', tierBreakdown['ultimate'] ?? 0, AppColors.accentPink),
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppBorderRadius.lg,
        border: Border.all(color: AppColors.cardBorder),
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Subscription Distribution',
            style: AppTypography.bodyBold.copyWith(color: AppColors.textPrimary),
          ),
          SizedBox(height: AppSpacing.base),
          ...tierData.map((tier) {
            final percentage = total > 0 ? (tier.$2 / total) : 0.0;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tier.$1,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        '${tier.$2} (${(percentage * 100).toStringAsFixed(1)}%)',
                        style: AppTypography.bodySmall.copyWith(
                          color: tier.$3,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: percentage.toDouble(),
                      backgroundColor: AppColors.surfaceLight,
                      valueColor: AlwaysStoppedAnimation<Color>(tier.$3),
                      minHeight: 6,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

// ── Quick Actions Grid ─────────────────────────────────────────
class _QuickActionsGrid extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: AppSpacing.md,
      crossAxisSpacing: AppSpacing.md,
      childAspectRatio: 2.5,
      children: [
        _QuickActionCard(
          title: 'Manage Users',
          icon: Icons.people,
          color: const Color(0xFF4facfe),
          onTap: () {
            ref.read(adminProvider.notifier).setAdminNavIndex(1);
            ref.read(adminProvider.notifier).fetchUsers();
          }
        ),
        _QuickActionCard(
          title: 'Manage Characters',
          icon: Icons.auto_fix_high,
          color: const Color(0xFFff0844),
          onTap: () {
            ref.read(adminProvider.notifier).setAdminNavIndex(2);
            ref.read(adminProvider.notifier).fetchCharacters();
          }
        ),
        _QuickActionCard(
          title: 'View Subscriptions',
          icon: Icons.card_membership,
          color: const Color(0xFFa18cd1),
          onTap: () {
            ref.read(adminProvider.notifier).setAdminNavIndex(3);
            ref.read(adminProvider.notifier).fetchSubscriptions();
          }
        ),
        _QuickActionCard(
          title: 'Coin Transactions',
          icon: Icons.monetization_on,
          color: const Color(0xFFf59e0b),
          onTap: () => context.push('/admin/transactions'),
        ),
      ],
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppBorderRadius.md,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: AppBorderRadius.md,
          border: Border.all(color: AppColors.cardBorder),
        ),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withAlpha(38),
                borderRadius: AppBorderRadius.sm,
              ),
              child: Icon(icon, size: 20, color: color),
            ),
            SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                title,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: AppColors.textMuted,
            ),
          ],
        ),
      ),
    );
  }
}

// ── Recent Activity Section ────────────────────────────────────
class _RecentActivitySection extends StatelessWidget {
  final Map<String, dynamic> activity;

  const _RecentActivitySection({required this.activity});

  @override
  Widget build(BuildContext context) {
    final recentUsers = (activity['recentUsers'] ?? []) as List;
    final recentCharacters = (activity['recentCharacters'] ?? []) as List;

    if (recentUsers.isEmpty && recentCharacters.isEmpty) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: AppBorderRadius.lg,
          border: Border.all(color: AppColors.cardBorder),
        ),
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Center(
          child: Text(
            'No recent activity',
            style: AppTypography.body.copyWith(color: AppColors.textMuted),
          ),
        ),
      );
    }

    return Column(
      children: [
        if (recentUsers.isNotEmpty)
          _ActivitySection(
            title: 'Recent Users',
            icon: Icons.person_add,
            items: recentUsers.take(5).toList(),
            itemBuilder: (item) => _ActivityTile(
              avatar: item['avatar_url'],
              title: item['username'] ?? item['display_name'] ?? 'Unknown',
              subtitle: item['subscription_tier'] ?? 'free',
              time: item['created_at'],
            ),
          ),
        if (recentUsers.isNotEmpty && recentCharacters.isNotEmpty)
          SizedBox(height: AppSpacing.md),
        if (recentCharacters.isNotEmpty)
          _ActivitySection(
            title: 'Recent Characters',
            icon: Icons.auto_fix_high,
            items: recentCharacters.take(5).toList(),
            itemBuilder: (item) => _ActivityTile(
              avatar: item['avatar_url'],
              title: item['name'] ?? 'Unknown',
              subtitle: '${item['chat_count'] ?? 0} chats',
              time: item['created_at'],
            ),
          ),
      ],
    );
  }
}

class _ActivitySection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List items;
  final Widget Function(dynamic item) itemBuilder;

  const _ActivitySection({
    required this.title,
    required this.icon,
    required this.items,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppBorderRadius.lg,
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                Icon(icon, size: 18, color: AppColors.primary),
                SizedBox(width: AppSpacing.sm),
                Text(
                  title,
                  style: AppTypography.bodyBold.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: AppColors.divider),
          ...items.map((item) => itemBuilder(item)),
        ],
      ),
    );
  }
}

class _ActivityTile extends StatelessWidget {
  final String? avatar;
  final String title;
  final String subtitle;
  final String? time;

  const _ActivityTile({
    this.avatar,
    required this.title,
    required this.subtitle,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: 2,
      ),
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: AppColors.surfaceLight,
        backgroundImage: avatar != null && avatar!.isNotEmpty
            ? NetworkImage(AppConfig.resolveImageUrl(avatar!) ?? '')
            : null,
        child: (avatar == null || avatar!.isEmpty)
            ? const Icon(Icons.person, size: 18, color: AppColors.textMuted)
            : null,
      ),
      title: Text(
        title,
        style: AppTypography.bodySmall.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        subtitle,
        style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
      ),
      trailing: time != null
          ? Text(
              _formatTimeAgo(time!),
              style: AppTypography.caption.copyWith(color: AppColors.textMuted),
            )
          : null,
    );
  }

  String _formatTimeAgo(String dateTime) {
    try {
      final date = DateTime.parse(dateTime);
      final now = DateTime.now();
      final diff = now.difference(date);
      if (diff.inDays > 0) return '${diff.inDays}d ago';
      if (diff.inHours > 0) return '${diff.inHours}h ago';
      if (diff.inMinutes > 0) return '${diff.inMinutes}m ago';
      return 'just now';
    } catch (e) {
      return '';
    }
  }
}

// ═══════════════════════════════════════════════════════════════
// Users Tab
// ═══════════════════════════════════════════════════════════════
class _AdminUsersTab extends ConsumerStatefulWidget {
  const _AdminUsersTab();

  @override
  ConsumerState<_AdminUsersTab> createState() => _AdminUsersTabState();
}

class _AdminUsersTabState extends ConsumerState<_AdminUsersTab> {
  final _searchController = TextEditingController();
  bool _showFilters = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adminProvider);

    return Column(
      children: [
        // Search & Filter Bar
        Container(
          padding: const EdgeInsets.all(AppSpacing.base),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      style: AppTypography.body.copyWith(color: AppColors.textPrimary),
                      decoration: InputDecoration(
                        hintText: 'Search users...',
                        hintStyle: AppTypography.body.copyWith(color: AppColors.textMuted),
                        prefixIcon: const Icon(Icons.search, color: AppColors.textMuted),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear, size: 18),
                                onPressed: () {
                                  _searchController.clear();
                                  ref.read(adminProvider.notifier).setUserSearch('');
                                  ref.read(adminProvider.notifier).fetchUsers();
                                },
                              )
                            : null,
                        filled: true,
                        fillColor: AppColors.surface,
                        border: OutlineInputBorder(
                          borderRadius: AppBorderRadius.md,
                          borderSide: BorderSide(color: AppColors.inputBorder),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: AppBorderRadius.md,
                          borderSide: BorderSide(color: AppColors.inputBorder),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: AppBorderRadius.md,
                          borderSide: const BorderSide(color: AppColors.primary),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.sm,
                        ),
                      ),
                      onSubmitted: (value) {
                        ref.read(adminProvider.notifier).setUserSearch(value);
                        ref.read(adminProvider.notifier).fetchUsers();
                      },
                    ),
                  ),
                  SizedBox(width: AppSpacing.sm),
                  IconButton(
                    icon: Icon(
                      _showFilters ? Icons.filter_list_off : Icons.filter_list,
                      color: _showFilters ? AppColors.primary : AppColors.textSecondary,
                    ),
                    onPressed: () => setState(() => _showFilters = !_showFilters),
                  ),
                ],
              ),
              if (_showFilters) ...[
                SizedBox(height: AppSpacing.sm),
                _UserFilterChips(
                  selectedTier: state.userTierFilter,
                  selectedSort: state.userSort,
                  onTierChanged: (tier) {
                    ref.read(adminProvider.notifier).setUserTierFilter(tier);
                    ref.read(adminProvider.notifier).fetchUsers();
                  },
                  onSortChanged: (sort) {
                    ref.read(adminProvider.notifier).setUserSort(sort);
                    ref.read(adminProvider.notifier).fetchUsers();
                  },
                ),
              ],
            ],
          ),
        ),

        // User Count
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.base),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${state.users.total} users found',
                style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.sm),

        // User List
        Expanded(
          child: state.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
              : state.users.items.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.people_outline, size: 48, color: AppColors.textMuted),
                          SizedBox(height: AppSpacing.md),
                          Text(
                            'No users found',
                            style: AppTypography.body.copyWith(color: AppColors.textMuted),
                          ),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () => ref.read(adminProvider.notifier).fetchUsers(),
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.base),
                        itemCount: state.users.items.length,
                        separatorBuilder: (_, __) => SizedBox(height: AppSpacing.sm),
                        itemBuilder: (context, index) {
                          final user = state.users.items[index];
                          return _UserCard(
                            user: user,
                            onTap: () => _showUserDetail(context, user.id),
                          );
                        },
                      ),
                    ),
        ),
      ],
    );
  }

  void _showUserDetail(BuildContext context, String userId) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _UserDetailSheet(userId: userId),
    );
  }
}

// ── User Filter Chips ──────────────────────────────────────────
class _UserFilterChips extends StatelessWidget {
  final String selectedTier;
  final String selectedSort;
  final ValueChanged<String> onTierChanged;
  final ValueChanged<String> onSortChanged;

  const _UserFilterChips({
    required this.selectedTier,
    required this.selectedSort,
    required this.onTierChanged,
    required this.onSortChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tier Filter
        Text(
          'Subscription Tier',
          style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
        ),
        SizedBox(height: 4),
        Wrap(
          spacing: AppSpacing.sm,
          children: [
            _FilterChip(
              label: 'All',
              selected: selectedTier == 'all',
              onTap: () => onTierChanged('all'),
            ),
            _FilterChip(
              label: 'Free',
              selected: selectedTier == 'free',
              onTap: () => onTierChanged('free'),
            ),
            _FilterChip(
              label: 'Starter',
              selected: selectedTier == 'starter',
              onTap: () => onTierChanged('starter'),
            ),
            _FilterChip(
              label: 'Pro',
              selected: selectedTier == 'pro',
              onTap: () => onTierChanged('pro'),
            ),
            _FilterChip(
              label: 'Ultimate',
              selected: selectedTier == 'ultimate',
              onTap: () => onTierChanged('ultimate'),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        // Sort
        Text(
          'Sort By',
          style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
        ),
        SizedBox(height: 4),
        Wrap(
          spacing: AppSpacing.sm,
          children: [
            _FilterChip(
              label: 'Newest',
              selected: selectedSort == 'newest',
              onTap: () => onSortChanged('newest'),
            ),
            _FilterChip(
              label: 'Oldest',
              selected: selectedSort == 'oldest',
              onTap: () => onSortChanged('oldest'),
            ),
            _FilterChip(
              label: 'Name',
              selected: selectedSort == 'name',
              onTap: () => onSortChanged('name'),
            ),
            _FilterChip(
              label: 'Most Coins',
              selected: selectedSort == 'coins_high',
              onTap: () => onSortChanged('coins_high'),
            ),
          ],
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary.withAlpha(51) : AppColors.surfaceLight,
          borderRadius: AppBorderRadius.xs,
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.cardBorder,
          ),
        ),
        child: Text(
          label,
          style: AppTypography.caption.copyWith(
            color: selected ? AppColors.primary : AppColors.textSecondary,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

// ── User Card ──────────────────────────────────────────────────
class _UserCard extends StatelessWidget {
  final Profile user;
  final VoidCallback onTap;

  const _UserCard({required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppBorderRadius.md,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: AppBorderRadius.md,
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.surfaceLight,
              backgroundImage: user.avatarUrl != null ? NetworkImage(AppConfig.resolveImageUrl(user.avatarUrl!)!) : null,
              child: user.avatarUrl == null
                  ? const Icon(Icons.person, color: AppColors.textMuted)
                  : null,
            ),
            SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.username ?? user.displayName ?? 'Unnamed',
                    style: AppTypography.bodyBold.copyWith(color: AppColors.textPrimary),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      _TierBadge(tier: user.subscriptionTier),
                      SizedBox(width: AppSpacing.sm),
                      Icon(Icons.monetization_on, size: 12, color: AppColors.accentGold),
                      SizedBox(width: 2),
                      Text(
                        '${user.coinBalance}',
                        style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: AppColors.textMuted, size: 20),
          ],
        ),
      ),
    );
  }
}

// ── Tier Badge ─────────────────────────────────────────────────
class _TierBadge extends StatelessWidget {
  final SubscriptionTier tier;

  const _TierBadge({required this.tier});

  @override
  Widget build(BuildContext context) {
    final color = switch (tier) {
      SubscriptionTier.free => AppColors.textMuted,
      SubscriptionTier.starter => AppColors.accentCyan,
      SubscriptionTier.pro => AppColors.accentGold,
      SubscriptionTier.ultimate => AppColors.accentPink,
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withAlpha(38),
        borderRadius: AppBorderRadius.xsmall,
      ),
      child: Text(
        tier.displayName,
        style: AppTypography.caption.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 10,
        ),
      ),
    );
  }
}

// ── User Detail Sheet ──────────────────────────────────────────
class _UserDetailSheet extends ConsumerStatefulWidget {
  final String userId;

  const _UserDetailSheet({required this.userId});

  @override
  ConsumerState<_UserDetailSheet> createState() => _UserDetailSheetState();
}

class _UserDetailSheetState extends ConsumerState<_UserDetailSheet> {
  late final Future<UserDetail> _future;

  @override
  void initState() {
    super.initState();
    _future = ref.read(adminProvider.notifier).getUserDetail(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      expand: false,
      builder: (context, scrollController) {
        return FutureBuilder<UserDetail>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.error_outline, size: 48, color: AppColors.error),
                      const SizedBox(height: 12),
                      Text(
                        'Failed to load user details',
                        style: AppTypography.body.copyWith(color: AppColors.error),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        snapshot.error.toString(),
                        style: AppTypography.caption.copyWith(color: AppColors.textMuted),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }

            final userDetail = snapshot.data!;

            final user = userDetail.profile;

            return Container(
              decoration: const BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.all(AppSpacing.base),
                children: [
                  // Handle
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.textMuted,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.lg),

                  // User Info
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 36,
                          backgroundColor: AppColors.surfaceLight,
                          backgroundImage: user.avatarUrl != null && user.avatarUrl!.isNotEmpty
                              ? NetworkImage(AppConfig.resolveImageUrl(user.avatarUrl!) ?? '')
                              : null,
                          child: (user.avatarUrl == null || user.avatarUrl!.isEmpty)
                              ? const Icon(Icons.person, size: 36, color: AppColors.textMuted)
                              : null,
                        ),
                        SizedBox(height: AppSpacing.sm),
                        Text(
                          user.username ?? 'Unnamed',
                          style: AppTypography.h3.copyWith(color: AppColors.textPrimary),
                        ),
                        if (user.displayName != null)
                          Text(
                            user.displayName!,
                            style: AppTypography.body.copyWith(color: AppColors.textSecondary),
                          ),
                        SizedBox(height: AppSpacing.sm),
                        _TierBadge(tier: user.subscriptionTier),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.xl),

                  // Stats Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _DetailStatItem(
                        label: 'Coins',
                        value: '${user.coinBalance}',
                        icon: Icons.monetization_on,
                        color: AppColors.accentGold,
                      ),
                      _DetailStatItem(
                        label: 'Conversations',
                        value: '${userDetail.conversationCount}',
                        icon: Icons.chat_bubble,
                        color: AppColors.accentCyan,
                      ),
                      _DetailStatItem(
                        label: 'Favorites',
                        value: '${userDetail.favoriteCount}',
                        icon: Icons.favorite,
                        color: AppColors.accentPink,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.xl),

                  // Actions
                  Row(
                    children: [
                      Expanded(
                        child: _ActionButton(
                          label: 'Grant Coins',
                          icon: Icons.add_circle,
                          color: AppColors.success,
                          onTap: () => _showCoinDialog(context, ref, widget.userId, true),
                        ),
                      ),
                      SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: _ActionButton(
                          label: 'Deduct Coins',
                          icon: Icons.remove_circle,
                          color: AppColors.warning,
                          onTap: () => _showCoinDialog(context, ref, widget.userId, false),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  SizedBox(
                    width: double.infinity,
                    child: _ActionButton(
                      label: 'Ban User',
                      icon: Icons.block,
                      color: AppColors.error,
                      onTap: () => _confirmBan(context, ref, widget.userId, user.username ?? 'this user'),
                    ),
                  ),
                  SizedBox(height: AppSpacing.xl),

                  // Subscriptions
                  if (userDetail.subscriptions.isNotEmpty) ...[
                    Text(
                      'Subscriptions',
                      style: AppTypography.bodyBold.copyWith(color: AppColors.textPrimary),
                    ),
                    SizedBox(height: AppSpacing.sm),
                    ...userDetail.subscriptions.map((sub) => Container(
                      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceLight,
                        borderRadius: AppBorderRadius.sm,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${sub['plan'] ?? 'unknown'}',
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          _StatusBadge(status: sub['status'] ?? 'unknown'),
                        ],
                      ),
                    )),
                  ],

                  // Recent Transactions
                  if (userDetail.recentTransactions.isNotEmpty) ...[
                    SizedBox(height: AppSpacing.base),
                    Text(
                      'Recent Transactions',
                      style: AppTypography.bodyBold.copyWith(color: AppColors.textPrimary),
                    ),
                    SizedBox(height: AppSpacing.sm),
                    ...userDetail.recentTransactions.map((tx) => Container(
                      margin: const EdgeInsets.only(bottom: AppSpacing.xs),
                      padding: const EdgeInsets.all(AppSpacing.sm),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceLight,
                        borderRadius: AppBorderRadius.sm,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              tx['description'] ?? tx['type'] ?? '',
                              style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
                            ),
                          ),
                          Text(
                            '${tx['amount'] > 0 ? '+' : ''}${tx['amount']}',
                            style: AppTypography.bodySmall.copyWith(
                              color: tx['amount'] > 0 ? AppColors.success : AppColors.error,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showCoinDialog(BuildContext context, WidgetRef ref, String userId, bool isGrant) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(isGrant ? 'Grant Coins' : 'Deduct Coins'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: AppTypography.body.copyWith(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: 'Amount',
            hintStyle: AppTypography.body.copyWith(color: AppColors.textMuted),
            filled: true,
            fillColor: AppColors.surfaceLight,
            border: OutlineInputBorder(
              borderRadius: AppBorderRadius.sm,
              borderSide: BorderSide(color: AppColors.inputBorder),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final amount = int.tryParse(controller.text) ?? 0;
              if (amount <= 0) return;
              final coins = isGrant ? amount : -amount;
              final success = await ref
                  .read(adminProvider.notifier)
                  .updateUserBalance(userId, coins);
              if (context.mounted) {
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(success ? 'Balance updated' : 'Failed to update'),
                    backgroundColor: success ? AppColors.success : AppColors.error,
                  ),
                );
              }
            },
            child: Text(
              isGrant ? 'Grant' : 'Deduct',
              style: TextStyle(color: isGrant ? AppColors.success : AppColors.warning),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmBan(BuildContext context, WidgetRef ref, String userId, String username) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text('Ban User'),
        content: Text('Are you sure you want to ban $username? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              final success = await ref.read(adminProvider.notifier).banUser(userId);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(success ? 'User banned' : 'Failed to ban user'),
                    backgroundColor: success ? AppColors.success : AppColors.error,
                  ),
                );
              }
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Ban'),
          ),
        ],
      ),
    );
  }
}

class _DetailStatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _DetailStatItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 24, color: color),
        SizedBox(height: 4),
        Text(
          value,
          style: AppTypography.h3.copyWith(color: AppColors.textPrimary),
        ),
        Text(
          label,
          style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppBorderRadius.sm,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        decoration: BoxDecoration(
          color: color.withAlpha(38),
          borderRadius: AppBorderRadius.sm,
          border: Border.all(color: color.withAlpha(77)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: color),
            SizedBox(width: 6),
            Text(
              label,
              style: AppTypography.bodySmall.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      'active' => AppColors.success,
      'cancelled' => AppColors.error,
      'expired' => AppColors.textMuted,
      _ => AppColors.textMuted,
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withAlpha(38),
        borderRadius: AppBorderRadius.xsmall,
      ),
      child: Text(
        status,
        style: AppTypography.caption.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// Characters Tab
// ═══════════════════════════════════════════════════════════════
class _AdminCharactersTab extends ConsumerStatefulWidget {
  const _AdminCharactersTab();

  @override
  ConsumerState<_AdminCharactersTab> createState() => _AdminCharactersTabState();
}

class _AdminCharactersTabState extends ConsumerState<_AdminCharactersTab> {
  final _searchController = TextEditingController();
  bool _showFilters = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(adminProvider.notifier).fetchCharacters();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adminProvider);

    return Column(
      children: [
        // Search & Filter Bar
        Container(
          padding: const EdgeInsets.all(AppSpacing.base),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      style: AppTypography.body.copyWith(color: AppColors.textPrimary),
                      decoration: InputDecoration(
                        hintText: 'Search characters...',
                        hintStyle: AppTypography.body.copyWith(color: AppColors.textMuted),
                        prefixIcon: const Icon(Icons.search, color: AppColors.textMuted),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear, size: 18),
                                onPressed: () {
                                  _searchController.clear();
                                  ref.read(adminProvider.notifier).setCharacterSearch('');
                                  ref.read(adminProvider.notifier).fetchCharacters();
                                },
                              )
                            : null,
                        filled: true,
                        fillColor: AppColors.surface,
                        border: OutlineInputBorder(
                          borderRadius: AppBorderRadius.md,
                          borderSide: BorderSide(color: AppColors.inputBorder),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: AppBorderRadius.md,
                          borderSide: BorderSide(color: AppColors.inputBorder),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: AppBorderRadius.md,
                          borderSide: const BorderSide(color: AppColors.primary),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.sm,
                        ),
                      ),
                      onSubmitted: (value) {
                        ref.read(adminProvider.notifier).setCharacterSearch(value);
                        ref.read(adminProvider.notifier).fetchCharacters();
                      },
                    ),
                  ),
                  SizedBox(width: AppSpacing.sm),
                  IconButton(
                    icon: Icon(
                      _showFilters ? Icons.filter_list_off : Icons.filter_list,
                      color: _showFilters ? AppColors.primary : AppColors.textSecondary,
                    ),
                    onPressed: () => setState(() => _showFilters = !_showFilters),
                  ),
                ],
              ),
              if (_showFilters) ...[
                SizedBox(height: AppSpacing.sm),
                _CharacterFilterChips(
                  selectedStyle: state.characterStyleFilter,
                  selectedGender: state.characterGenderFilter,
                  selectedVisibility: state.characterVisibilityFilter,
                  selectedSort: state.characterSort,
                  onStyleChanged: (style) {
                    ref.read(adminProvider.notifier).setCharacterStyleFilter(style);
                    ref.read(adminProvider.notifier).fetchCharacters();
                  },
                  onGenderChanged: (gender) {
                    ref.read(adminProvider.notifier).setCharacterGenderFilter(gender);
                    ref.read(adminProvider.notifier).fetchCharacters();
                  },
                  onVisibilityChanged: (visibility) {
                    ref.read(adminProvider.notifier).setCharacterVisibilityFilter(visibility);
                    ref.read(adminProvider.notifier).fetchCharacters();
                  },
                  onSortChanged: (sort) {
                    ref.read(adminProvider.notifier).setCharacterSort(sort);
                    ref.read(adminProvider.notifier).fetchCharacters();
                  },
                ),
              ],
            ],
          ),
        ),

        // Character Count
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.base),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${state.characters.total} characters found',
                style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.sm),

        // Character List
        Expanded(
          child: state.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
              : state.characters.items.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.auto_fix_high_outlined, size: 48, color: AppColors.textMuted),
                          SizedBox(height: AppSpacing.md),
                          Text(
                            'No characters found',
                            style: AppTypography.body.copyWith(color: AppColors.textMuted),
                          ),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () => ref.read(adminProvider.notifier).fetchCharacters(),
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.base),
                        itemCount: state.characters.items.length,
                        separatorBuilder: (_, __) => SizedBox(height: AppSpacing.sm),
                        itemBuilder: (context, index) {
                          final character = state.characters.items[index];
                          return _CharacterCard(
                            character: character,
                            onTap: () => _showCharacterDetail(context, character.id),
                            onTogglePublic: () async {
                              final success = await ref
                                  .read(adminProvider.notifier)
                                  .toggleCharacterPublic(character.id);
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(success ? 'Visibility toggled' : 'Failed'),
                                    backgroundColor: success ? AppColors.success : AppColors.error,
                                  ),
                                );
                              }
                            },
                            onDelete: () => _confirmDeleteCharacter(
                              context,
                              ref,
                              character.id,
                              character.name,
                            ),
                          );
                        },
                      ),
                    ),
        ),
      ],
    );
  }

  void _showCharacterDetail(BuildContext context, String characterId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _CharacterDetailSheet(characterId: characterId),
    );
  }

  void _confirmDeleteCharacter(
    BuildContext context,
    WidgetRef ref,
    String characterId,
    String name,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text('Delete Character'),
        content: Text('Are you sure you want to delete "$name"? This cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              final success = await ref
                  .read(adminProvider.notifier)
                  .deleteCharacter(characterId);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(success ? 'Character deleted' : 'Failed to delete'),
                    backgroundColor: success ? AppColors.success : AppColors.error,
                  ),
                );
              }
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

// ── Character Filter Chips ─────────────────────────────────────
class _CharacterFilterChips extends StatelessWidget {
  final String selectedStyle;
  final String selectedGender;
  final String selectedVisibility;
  final String selectedSort;
  final ValueChanged<String> onStyleChanged;
  final ValueChanged<String> onGenderChanged;
  final ValueChanged<String> onVisibilityChanged;
  final ValueChanged<String> onSortChanged;

  const _CharacterFilterChips({
    required this.selectedStyle,
    required this.selectedGender,
    required this.selectedVisibility,
    required this.selectedSort,
    required this.onStyleChanged,
    required this.onGenderChanged,
    required this.onVisibilityChanged,
    required this.onSortChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Style Filter
        Text('Style', style: AppTypography.caption.copyWith(color: AppColors.textSecondary)),
        SizedBox(height: 4),
        Wrap(
          spacing: AppSpacing.sm,
          children: [
            _FilterChip(label: 'All', selected: selectedStyle == 'all', onTap: () => onStyleChanged('all')),
            _FilterChip(label: 'Anime', selected: selectedStyle == 'anime', onTap: () => onStyleChanged('anime')),
            _FilterChip(label: 'Realistic', selected: selectedStyle == 'realistic', onTap: () => onStyleChanged('realistic')),
            _FilterChip(label: 'Cartoon', selected: selectedStyle == 'cartoon', onTap: () => onStyleChanged('cartoon')),
            _FilterChip(label: '3D', selected: selectedStyle == '3d', onTap: () => onStyleChanged('3d')),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        // Gender Filter
        Text('Gender', style: AppTypography.caption.copyWith(color: AppColors.textSecondary)),
        SizedBox(height: 4),
        Wrap(
          spacing: AppSpacing.sm,
          children: [
            _FilterChip(label: 'All', selected: selectedGender == 'all', onTap: () => onGenderChanged('all')),
            _FilterChip(label: 'Female', selected: selectedGender == 'female', onTap: () => onGenderChanged('female')),
            _FilterChip(label: 'Male', selected: selectedGender == 'male', onTap: () => onGenderChanged('male')),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        // Visibility Filter
        Text('Visibility', style: AppTypography.caption.copyWith(color: AppColors.textSecondary)),
        SizedBox(height: 4),
        Wrap(
          spacing: AppSpacing.sm,
          children: [
            _FilterChip(label: 'All', selected: selectedVisibility == 'all', onTap: () => onVisibilityChanged('all')),
            _FilterChip(label: 'Public', selected: selectedVisibility == 'public', onTap: () => onVisibilityChanged('public')),
            _FilterChip(label: 'Private', selected: selectedVisibility == 'private', onTap: () => onVisibilityChanged('private')),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        // Sort
        Text('Sort By', style: AppTypography.caption.copyWith(color: AppColors.textSecondary)),
        SizedBox(height: 4),
        Wrap(
          spacing: AppSpacing.sm,
          children: [
            _FilterChip(label: 'Newest', selected: selectedSort == 'newest', onTap: () => onSortChanged('newest')),
            _FilterChip(label: 'Popular', selected: selectedSort == 'popular', onTap: () => onSortChanged('popular')),
            _FilterChip(label: 'Most Favorites', selected: selectedSort == 'favorites', onTap: () => onSortChanged('favorites')),
            _FilterChip(label: 'Name', selected: selectedSort == 'name', onTap: () => onSortChanged('name')),
          ],
        ),
      ],
    );
  }
}

// ── Character Card ─────────────────────────────────────────────
class _CharacterCard extends StatelessWidget {
  final Character character;
  final VoidCallback onTap;
  final VoidCallback onTogglePublic;
  final VoidCallback onDelete;

  const _CharacterCard({
    required this.character,
    required this.onTap,
    required this.onTogglePublic,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppBorderRadius.md,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: AppBorderRadius.md,
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.surfaceLight,
              backgroundImage: character.avatarUrl != null && character.avatarUrl!.isNotEmpty
                  ? NetworkImage(AppConfig.resolveImageUrl(character.avatarUrl!) ?? '')
                  : null,
              child: (character.avatarUrl == null || character.avatarUrl!.isEmpty)
                  ? const Icon(Icons.person, color: AppColors.textMuted)
                  : null,
            ),
            SizedBox(width: AppSpacing.md),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          character.name,
                          style: AppTypography.bodyBold.copyWith(color: AppColors.textPrimary),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (character.isOfficial)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                          decoration: BoxDecoration(
                            color: AppColors.accentGold.withAlpha(38),
                            borderRadius: AppBorderRadius.xsmall,
                          ),
                          child: Icon(Icons.verified, size: 12, color: AppColors.accentGold),
                        ),
                    ],
                  ),
                  if (character.tagline != null)
                    Text(
                      character.tagline!,
                      style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      _CharacterStatChip(
                        icon: Icons.chat_bubble_outline,
                        value: '${character.chatCount}',
                      ),
                      SizedBox(width: AppSpacing.sm),
                      _CharacterStatChip(
                        icon: Icons.favorite_outline,
                        value: '${character.favoriteCount}',
                      ),
                      SizedBox(width: AppSpacing.sm),
                      _VisibilityChip(isPublic: character.isPublic),
                      if (character.isNsfw) ...[
                        SizedBox(width: AppSpacing.sm),
                        _NSFWChip(),
                      ],
                    ],
                  ),
                ],
              ),
            ),

            // Actions
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: AppColors.textMuted, size: 20),
              color: AppColors.surface,
              onSelected: (value) {
                if (value == 'toggle') onTogglePublic();
                if (value == 'delete') onDelete();
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'toggle',
                  child: Row(
                    children: [
                      Icon(
                        character.isPublic ? Icons.visibility_off : Icons.visibility,
                        size: 18,
                        color: AppColors.textSecondary,
                      ),
                      SizedBox(width: 8),
                      Text(
                        character.isPublic ? 'Make Private' : 'Make Public',
                        style: AppTypography.bodySmall.copyWith(color: AppColors.textPrimary),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      const Icon(Icons.delete, size: 18, color: AppColors.error),
                      SizedBox(width: 8),
                      Text(
                        'Delete',
                        style: AppTypography.bodySmall.copyWith(color: AppColors.error),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CharacterStatChip extends StatelessWidget {
  final IconData icon;
  final String value;

  const _CharacterStatChip({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: AppColors.textMuted),
        SizedBox(width: 3),
        Text(
          value,
          style: AppTypography.caption.copyWith(color: AppColors.textMuted),
        ),
      ],
    );
  }
}

class _VisibilityChip extends StatelessWidget {
  final bool isPublic;

  const _VisibilityChip({required this.isPublic});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      decoration: BoxDecoration(
        color: (isPublic ? AppColors.success : AppColors.warning).withAlpha(38),
        borderRadius: AppBorderRadius.xsmall,
      ),
      child: Text(
        isPublic ? 'Public' : 'Private',
        style: AppTypography.caption.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _NSFWChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      decoration: BoxDecoration(
        color: AppColors.error.withAlpha(38),
        borderRadius: AppBorderRadius.xsmall,
      ),
      child: Text(
        'NSFW',
        style: AppTypography.caption.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: AppColors.error,
        ),
      ),
    );
  }
}

// ── Character Detail Sheet ─────────────────────────────────────
class _CharacterDetailSheet extends ConsumerStatefulWidget {
  final String characterId;

  const _CharacterDetailSheet({required this.characterId});

  @override
  ConsumerState<_CharacterDetailSheet> createState() => _CharacterDetailSheetState();
}

class _CharacterDetailSheetState extends ConsumerState<_CharacterDetailSheet> {
  late final Future<CharacterDetail> _future;

  @override
  void initState() {
    super.initState();
    _future = ref.read(adminProvider.notifier).getCharacterDetail(widget.characterId);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      expand: false,
      builder: (context, scrollController) {
        return FutureBuilder<CharacterDetail>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(color: AppColors.primary));
            }

            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.error_outline, size: 48, color: AppColors.error),
                      const SizedBox(height: 12),
                      Text(
                        'Failed to load character details',
                        style: AppTypography.body.copyWith(color: AppColors.error),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        snapshot.error.toString(),
                        style: AppTypography.caption.copyWith(color: AppColors.textMuted),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }

            final detail = snapshot.data!;

            final char = detail.character;

            return Container(
              decoration: const BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.all(AppSpacing.base),
                children: [
                  // Handle
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.textMuted,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.lg),

                  // Character Info
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: AppColors.surfaceLight,
                          backgroundImage: char.avatarUrl != null && char.avatarUrl!.isNotEmpty
                              ? NetworkImage(AppConfig.resolveImageUrl(char.avatarUrl!) ?? '')
                              : null,
                          child: (char.avatarUrl == null || char.avatarUrl!.isEmpty)
                              ? const Icon(Icons.person, size: 40, color: AppColors.textMuted)
                              : null,
                        ),
                        SizedBox(height: AppSpacing.sm),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              char.name,
                              style: AppTypography.h3.copyWith(color: AppColors.textPrimary),
                            ),
                            if (char.isOfficial) ...[
                              SizedBox(width: 4),
                              Icon(Icons.verified, size: 18, color: AppColors.accentGold),
                            ],
                          ],
                        ),
                        if (char.tagline != null)
                          Text(
                            char.tagline!,
                            style: AppTypography.body.copyWith(color: AppColors.textSecondary),
                          ),
                        SizedBox(height: AppSpacing.sm),
                        Wrap(
                          spacing: AppSpacing.sm,
                          children: [
                            _VisibilityChip(isPublic: char.isPublic),
                            _CharacterStyleChip(style: char.style),
                            _GenderChip(gender: char.gender),
                            if (char.isNsfw) _NSFWChip(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.xl),

                  // Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _DetailStatItem(
                        label: 'Chats',
                        value: '${char.chatCount}',
                        icon: Icons.chat_bubble,
                        color: AppColors.accentCyan,
                      ),
                      _DetailStatItem(
                        label: 'Favorites',
                        value: '${char.favoriteCount}',
                        icon: Icons.favorite,
                        color: AppColors.accentPink,
                      ),
                      _DetailStatItem(
                        label: 'Conversations',
                        value: '${detail.conversationCount}',
                        icon: Icons.forum,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.xl),

                  // Description
                  if (char.description != null && char.description!.isNotEmpty) ...[
                    Text(
                      'Description',
                      style: AppTypography.bodyBold.copyWith(color: AppColors.textPrimary),
                    ),
                    SizedBox(height: AppSpacing.sm),
                    Text(
                      char.description!,
                      style: AppTypography.body.copyWith(color: AppColors.textSecondary),
                    ),
                    SizedBox(height: AppSpacing.xl),
                  ],

                  // Creator
                  if (detail.creator != null) ...[
                    Text(
                      'Creator',
                      style: AppTypography.bodyBold.copyWith(color: AppColors.textPrimary),
                    ),
                    SizedBox(height: AppSpacing.sm),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.surfaceLight,
                          backgroundImage: detail.creator!['avatar_url'] != null
                              ? NetworkImage(AppConfig.resolveImageUrl(detail.creator!['avatar_url']) ?? '')
                              : null,
                          child: detail.creator!['avatar_url'] == null
                              ? const Icon(Icons.person, size: 16, color: AppColors.textMuted)
                              : null,
                        ),
                        SizedBox(width: AppSpacing.sm),
                        Text(
                          detail.creator!['username'] ?? detail.creator!['display_name'] ?? 'Unknown',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],

                  // Categories
                  if (char.categories.isNotEmpty) ...[
                    SizedBox(height: AppSpacing.xl),
                    Text(
                      'Categories',
                      style: AppTypography.bodyBold.copyWith(color: AppColors.textPrimary),
                    ),
                    SizedBox(height: AppSpacing.sm),
                    Wrap(
                      spacing: AppSpacing.sm,
                      runSpacing: AppSpacing.sm,
                      children: char.categories.map((cat) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primaryMuted,
                          borderRadius: AppBorderRadius.sm,
                        ),
                        child: Text(
                          cat,
                          style: AppTypography.caption.copyWith(
                            color: AppColors.primaryLight,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )).toList(),
                    ),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _CharacterStyleChip extends StatelessWidget {
  final CharacterStyle style;

  const _CharacterStyleChip({required this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.accentCyan.withAlpha(38),
        borderRadius: AppBorderRadius.xsmall,
      ),
      child: Text(
        style.displayName,
        style: AppTypography.caption.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: AppColors.accentCyan,
        ),
      ),
    );
  }
}

class _GenderChip extends StatelessWidget {
  final CharacterGender gender;

  const _GenderChip({required this.gender});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.primaryMuted,
        borderRadius: AppBorderRadius.xsmall,
      ),
      child: Text(
        gender.displayName,
        style: AppTypography.caption.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryLight,
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// Subscriptions Tab
// ═══════════════════════════════════════════════════════════════
class _AdminSubscriptionsTab extends ConsumerStatefulWidget {
  const _AdminSubscriptionsTab();

  @override
  ConsumerState<_AdminSubscriptionsTab> createState() => _AdminSubscriptionsTabState();
}

class _AdminSubscriptionsTabState extends ConsumerState<_AdminSubscriptionsTab> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adminProvider);

    return Column(
      children: [
        // Filter
        Container(
          padding: const EdgeInsets.all(AppSpacing.base),
          child: Row(
            children: [
              Text(
                'Status: ',
                style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
              ),
              _FilterChip(
                label: 'All',
                selected: state.subscriptionStatusFilter == 'all',
                onTap: () {
                  ref.read(adminProvider.notifier).setSubscriptionStatusFilter('all');
                  ref.read(adminProvider.notifier).fetchSubscriptions();
                },
              ),
              SizedBox(width: AppSpacing.sm),
              _FilterChip(
                label: 'Active',
                selected: state.subscriptionStatusFilter == 'active',
                onTap: () {
                  ref.read(adminProvider.notifier).setSubscriptionStatusFilter('active');
                  ref.read(adminProvider.notifier).fetchSubscriptions();
                },
              ),
              SizedBox(width: AppSpacing.sm),
              _FilterChip(
                label: 'Cancelled',
                selected: state.subscriptionStatusFilter == 'cancelled',
                onTap: () {
                  ref.read(adminProvider.notifier).setSubscriptionStatusFilter('cancelled');
                  ref.read(adminProvider.notifier).fetchSubscriptions();
                },
              ),
            ],
          ),
        ),

        // Subscriptions List
        Expanded(
          child: state.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
              : state.subscriptions.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.card_membership_outlined, size: 48, color: AppColors.textMuted),
                          SizedBox(height: AppSpacing.md),
                          Text(
                            'No subscriptions found',
                            style: AppTypography.body.copyWith(color: AppColors.textMuted),
                          ),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () => ref.read(adminProvider.notifier).fetchSubscriptions(),
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.base),
                        itemCount: state.subscriptions.length,
                        separatorBuilder: (_, __) => SizedBox(height: AppSpacing.sm),
                        itemBuilder: (context, index) {
                          final sub = state.subscriptions[index];
                          final profiles = sub['profiles'];
                          return _SubscriptionCard(
                            plan: sub['plan'] ?? 'unknown',
                            status: sub['status'] ?? 'unknown',
                            userName: profiles?['username'] ?? profiles?['display_name'] ?? 'Unknown',
                            userAvatar: profiles?['avatar_url'],
                            startDate: sub['current_period_start'],
                            endDate: sub['current_period_end'],
                          );
                        },
                      ),
                    ),
        ),
      ],
    );
  }
}

class _SubscriptionCard extends StatelessWidget {
  final String plan;
  final String status;
  final String userName;
  final String? userAvatar;
  final String? startDate;
  final String? endDate;

  const _SubscriptionCard({
    required this.plan,
    required this.status,
    required this.userName,
    this.userAvatar,
    this.startDate,
    this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppBorderRadius.md,
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.surfaceLight,
            backgroundImage: userAvatar != null && userAvatar!.isNotEmpty
                ? NetworkImage(AppConfig.resolveImageUrl(userAvatar!) ?? '')
                : null,
            child: (userAvatar == null || userAvatar!.isEmpty)
                ? const Icon(Icons.person, color: AppColors.textMuted, size: 20)
                : null,
          ),
          SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: AppTypography.bodyBold.copyWith(color: AppColors.textPrimary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    _PlanBadge(plan: plan),
                    SizedBox(width: AppSpacing.sm),
                    _StatusBadge(status: status),
                  ],
                ),
                if (endDate != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'Renews: ${_formatDate(endDate!)}',
                      style: AppTypography.caption.copyWith(color: AppColors.textMuted),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String date) {
    try {
      final d = DateTime.parse(date);
      return '${d.month}/${d.day}/${d.year}';
    } catch (e) {
      return date;
    }
  }
}

class _PlanBadge extends StatelessWidget {
  final String plan;

  const _PlanBadge({required this.plan});

  @override
  Widget build(BuildContext context) {
    final color = switch (plan) {
      'starter' => AppColors.accentCyan,
      'pro' => AppColors.accentGold,
      'ultimate' => AppColors.accentPink,
      _ => AppColors.textMuted,
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withAlpha(38),
        borderRadius: AppBorderRadius.xsmall,
      ),
      child: Text(
        plan.toUpperCase(),
        style: AppTypography.caption.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}
