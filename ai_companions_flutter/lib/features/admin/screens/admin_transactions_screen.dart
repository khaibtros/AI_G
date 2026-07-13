import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_border_radius.dart';
import '../providers/admin_provider.dart';

class AdminTransactionsScreen extends ConsumerStatefulWidget {
  const AdminTransactionsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AdminTransactionsScreen> createState() => _AdminTransactionsScreenState();
}

class _AdminTransactionsScreenState extends ConsumerState<AdminTransactionsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(adminProvider.notifier).fetchCoinTransactions());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adminProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Coin Transactions (${state.coinTransactions.length})'),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Filter
          Container(
            padding: const EdgeInsets.all(AppSpacing.base),
            child: Row(
              children: [
                Text(
                  'Type: ',
                  style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                ),
                _FilterChip(
                  label: 'All',
                  selected: state.transactionTypeFilter == 'all',
                  onTap: () {
                    ref.read(adminProvider.notifier).setTransactionTypeFilter('all');
                    ref.read(adminProvider.notifier).fetchCoinTransactions();
                  },
                ),
                SizedBox(width: AppSpacing.sm),
                _FilterChip(
                  label: 'Spend',
                  selected: state.transactionTypeFilter == 'spend',
                  onTap: () {
                    ref.read(adminProvider.notifier).setTransactionTypeFilter('spend');
                    ref.read(adminProvider.notifier).fetchCoinTransactions();
                  },
                ),
                SizedBox(width: AppSpacing.sm),
                _FilterChip(
                  label: 'Reward',
                  selected: state.transactionTypeFilter == 'reward',
                  onTap: () {
                    ref.read(adminProvider.notifier).setTransactionTypeFilter('reward');
                    ref.read(adminProvider.notifier).fetchCoinTransactions();
                  },
                ),
                SizedBox(width: AppSpacing.sm),
                _FilterChip(
                  label: 'Purchase',
                  selected: state.transactionTypeFilter == 'purchase',
                  onTap: () {
                    ref.read(adminProvider.notifier).setTransactionTypeFilter('purchase');
                    ref.read(adminProvider.notifier).fetchCoinTransactions();
                  },
                ),
              ],
            ),
          ),

          // Transactions List
          Expanded(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
                : state.coinTransactions.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.receipt_long, size: 48, color: AppColors.textMuted),
                            SizedBox(height: AppSpacing.md),
                            Text(
                              'No transactions found',
                              style: AppTypography.body.copyWith(color: AppColors.textMuted),
                            ),
                          ],
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () => ref.read(adminProvider.notifier).fetchCoinTransactions(),
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.base),
                          itemCount: state.coinTransactions.length,
                          separatorBuilder: (_, __) => SizedBox(height: AppSpacing.sm),
                          itemBuilder: (context, index) {
                            final tx = state.coinTransactions[index];
                            final profiles = tx['profiles'];
                            return _TransactionCard(
                              description: tx['description'] ?? '',
                              amount: tx['amount'] ?? 0,
                              type: tx['type'] ?? 'unknown',
                              userName: profiles?['username'] ?? profiles?['display_name'] ?? 'Unknown',
                              userAvatar: profiles?['avatar_url'],
                              createdAt: tx['created_at'],
                            );
                          },
                        ),
                      ),
          ),
        ],
      ),
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
          color: selected ? AppColors.primary.withOpacity(0.2) : AppColors.surfaceLight,
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

class _TransactionCard extends StatelessWidget {
  final String description;
  final int amount;
  final String type;
  final String userName;
  final String? userAvatar;
  final String? createdAt;

  const _TransactionCard({
    required this.description,
    required this.amount,
    required this.type,
    required this.userName,
    this.userAvatar,
    this.createdAt,
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
            backgroundImage: userAvatar != null ? NetworkImage(userAvatar!) : null,
            child: userAvatar == null
                ? const Icon(Icons.person, color: AppColors.textMuted, size: 20)
                : null,
          ),
          SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: AppTypography.bodySmall.copyWith(color: AppColors.textPrimary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2),
                Text(
                  userName,
                  style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
          SizedBox(width: AppSpacing.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${amount > 0 ? '+' : ''}$amount',
                style: AppTypography.bodyBold.copyWith(
                  color: amount > 0 ? AppColors.success : (amount < 0 ? AppColors.error : AppColors.textPrimary),
                ),
              ),
              if (createdAt != null)
                Text(
                  _formatTimeAgo(createdAt!),
                  style: AppTypography.caption.copyWith(color: AppColors.textMuted),
                ),
            ],
          )
        ],
      ),
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
