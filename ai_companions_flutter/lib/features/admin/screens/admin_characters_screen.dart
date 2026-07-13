
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_companions_flutter/core/theme/app_colors.dart';
import 'package:ai_companions_flutter/core/theme/app_typography.dart';
import 'package:ai_companions_flutter/core/theme/app_spacing.dart';
import 'package:ai_companions_flutter/core/theme/app_border_radius.dart';
import 'package:ai_companions_flutter/features/admin/providers/admin_provider.dart';
import 'package:ai_companions_flutter/shared/models/character.dart';
import 'package:ai_companions_flutter/shared/models/enums.dart';

class AdminCharactersScreen extends ConsumerStatefulWidget {
  const AdminCharactersScreen({super.key});

  @override
  ConsumerState<AdminCharactersScreen> createState() => _AdminCharactersScreenState();
}

class _AdminCharactersScreenState extends ConsumerState<AdminCharactersScreen> {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Characters'),
        actions: [
          IconButton(
            icon: Icon(
              _showFilters ? Icons.filter_list_off : Icons.filter_list,
              color: _showFilters ? AppColors.primary : AppColors.textSecondary,
            ),
            onPressed: () => setState(() => _showFilters = !_showFilters),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search & Filter Bar
          Container(
            padding: const EdgeInsets.all(AppSpacing.base),
            child: Column(
              children: [
                TextField(
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
      ),
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
              backgroundImage: character.avatarUrl != null
                  ? NetworkImage(character.avatarUrl!)
                  : null,
              child: character.avatarUrl == null
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
                          backgroundImage: char.avatarUrl != null
                              ? NetworkImage(char.avatarUrl!)
                              : null,
                          child: char.avatarUrl == null
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
                              ? NetworkImage(detail.creator!['avatar_url'])
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
