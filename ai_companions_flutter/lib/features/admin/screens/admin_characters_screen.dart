import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_border_radius.dart';
import '../providers/admin_provider.dart';

class AdminCharactersScreen extends ConsumerStatefulWidget {
  const AdminCharactersScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AdminCharactersScreen> createState() =>
      _AdminCharactersScreenState();
}

class _AdminCharactersScreenState extends ConsumerState<AdminCharactersScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(adminProvider.notifier).fetchCharacters());
  }

  void _handleDeleteCharacter(String characterId, String characterName) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Character'),
        content: Text(
          'Are you sure you want to delete $characterName? This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              try {
                await ref
                    .read(adminProvider.notifier)
                    .deleteCharacter(characterId);
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to delete character: $e')),
                  );
                }
              }
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adminProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Characters (${state.characters.length})'),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () =>
                  ref.read(adminProvider.notifier).fetchCharacters(),
              child: state.characters.isEmpty
                  ? Center(
                      child: Text(
                        'No characters found.',
                        style: AppTypography.body.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      itemCount: state.characters.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: AppSpacing.sm),
                      itemBuilder: (context, index) {
                        final character = state.characters[index];
                        return Container(
                          padding: const EdgeInsets.all(AppSpacing.md),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: AppBorderRadius.lg,
                            border: Border.all(color: AppColors.cardBorder),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: character.avatarUrl != null
                                    ? NetworkImage(character.avatarUrl!)
                                    : null,
                                child: character.avatarUrl == null
                                    ? const Icon(Icons.person)
                                    : null,
                              ),
                              SizedBox(width: AppSpacing.md),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      character.name,
                                      style: AppTypography.bodyBold,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      character.tagline ?? 'No tagline',
                                      style: AppTypography.caption.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: AppSpacing.xs),
                                    Row(
                                      children: [
                                        _MetricChip(
                                          icon: Icons.chat_bubble_outline,
                                          value: '${character.chatCount}',
                                        ),
                                        SizedBox(width: AppSpacing.sm),
                                        _MetricChip(
                                          icon: Icons.favorite_outline,
                                          value: '${character.favoriteCount}',
                                        ),
                                        SizedBox(width: AppSpacing.sm),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: character.isPublic
                                                ? Colors.green.withOpacity(0.15)
                                                : Colors.orange.withOpacity(
                                                    0.15,
                                                  ),
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                          child: Text(
                                            character.isPublic
                                                ? 'Public'
                                                : 'Private',
                                            style: AppTypography.caption
                                                .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: AppColors.error,
                                ),
                                onPressed: () => _handleDeleteCharacter(
                                  character.id,
                                  character.name,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
    );
  }
}

class _MetricChip extends StatelessWidget {
  final IconData icon;
  final String value;

  const _MetricChip({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: AppColors.textSecondary),
        SizedBox(width: 4),
        Text(
          value,
          style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
