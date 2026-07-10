import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_border_radius.dart';
import '../../../core/constants/app_constants.dart';
import '../../../shared/models/index.dart';
import '../../character/providers/character_provider.dart';
import '../../shared/widgets/error_display_widget.dart';

class DiscoverScreen extends ConsumerStatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends ConsumerState<DiscoverScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String _activeTag = 'All';
  String? _activeDropdown;

  static const List<String> _sortOptions = ['popular', 'newest', 'name'];
  static const Map<String, String> _sortLabels = {
    'popular': 'Popular',
    'newest': 'Newest',
    'name': 'Name',
  };

  List<String> get _discoverTags => ['All', ...AppConstants.categories];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _scrollController.addListener(_onScroll);
    Future.microtask(() {
      ref.read(characterProvider.notifier).fetchCharacters(reset: true);
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _scrollController.removeListener(_onScroll);
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    // Debounced in handleSearch
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 500) {
      final state = ref.read(characterProvider);
      if (state.hasMore && !state.isLoadingMore && !state.isLoading) {
        ref.read(characterProvider.notifier).fetchMore();
      }
    }
  }

  void _handleSearch() {
    final query = _searchController.text.trim();
    ref
        .read(characterProvider.notifier)
        .setFilter('search', query.isNotEmpty ? query : null);
    ref.read(characterProvider.notifier).fetchCharacters(reset: true);
  }

  Future<void> _onRefresh() async {
    await ref.read(characterProvider.notifier).fetchCharacters(reset: true);
  }

  void _handleTagPress(String tag) {
    setState(() => _activeTag = tag);
    if (tag == 'All') {
      ref.read(characterProvider.notifier).setFilter('category', null);
    } else {
      ref.read(characterProvider.notifier).setFilter('category', tag);
    }
    ref.read(characterProvider.notifier).fetchCharacters(reset: true);
  }

  void _handleDropdownSelect(String type, String? value) {
    ref.read(characterProvider.notifier).setFilter(type, value);
    ref.read(characterProvider.notifier).fetchCharacters(reset: true);
    setState(() => _activeDropdown = null);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(characterProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          color: AppColors.primary,
          child: CustomScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: _buildHeader(state)),
              if (state.isLoading && state.characters.isEmpty)
                const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (state.error != null && state.characters.isEmpty)
                SliverFillRemaining(
                  child: ErrorDisplayWidget(
                    errorMessage: state.error!,
                    onRetry: () => ref
                        .read(characterProvider.notifier)
                        .fetchCharacters(reset: true),
                  ),
                )
              else if (state.characters.isEmpty)
                SliverFillRemaining(child: _buildEmpty())
              else ...[
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.base,
                  ),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.66,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return _buildCharacterCard(state.characters[index]);
                    }, childCount: state.characters.length),
                  ),
                ),
                if (state.isLoadingMore)
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.lg,
                      ),
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    ),
                  ),
              ],
              const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(CharacterListState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.base,
            AppSpacing.sm,
            AppSpacing.base,
            0,
          ),
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.inputBg,
              borderRadius: AppBorderRadius.medium,
              border: Border.all(color: AppColors.inputBorder),
            ),
            child: Row(
              children: [
                const SizedBox(width: AppSpacing.md),
                const Icon(Icons.search, size: 20, color: Color(0xFF666666)),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Try 'Busty blonde' or 'Petite asian'",
                      hintStyle: TextStyle(color: Color(0xFF666666)),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    onSubmitted: (_) => _handleSearch(),
                    textInputAction: TextInputAction.search,
                  ),
                ),
                if (_searchController.text.isNotEmpty)
                  GestureDetector(
                    onTap: () {
                      _searchController.clear();
                      ref
                          .read(characterProvider.notifier)
                          .setFilter('search', null);
                      ref
                          .read(characterProvider.notifier)
                          .fetchCharacters(reset: true);
                    },
                    child: const Icon(
                      Icons.close,
                      size: 18,
                      color: Color(0xFF666666),
                    ),
                  ),
                const SizedBox(width: AppSpacing.sm),
              ],
            ),
          ),
        ),

        // Filter Row
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.base,
            AppSpacing.md,
            AppSpacing.base,
            0,
          ),
          child: Row(
            children: [
              _buildFilterChip(
                label:
                    'Sort: ${_sortLabels[state.filters['sort']] ?? 'Popular'}',
                onTap: () => setState(() => _activeDropdown = 'sort'),
              ),
              const SizedBox(width: AppSpacing.xs),
              _buildFilterChip(
                label: 'Gender: ${_genderLabel(state.filters['gender'])}',
                onTap: () => setState(() => _activeDropdown = 'gender'),
                showArrow: true,
              ),
              const SizedBox(width: AppSpacing.xs),
              _buildFilterChip(
                label: 'Style: ${_styleLabel(state.filters['style'])}',
                onTap: () => setState(() => _activeDropdown = 'style'),
                showArrow: true,
              ),
            ],
          ),
        ),

        // Tag Chips
        Container(
          height: 50,
          margin: const EdgeInsets.only(top: AppSpacing.lg),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.base),
            itemCount: _discoverTags.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final tag = _discoverTags[index];
              final isActive = _activeTag == tag;
              return GestureDetector(
                onTap: () => _handleTagPress(tag),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      tag,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: isActive
                            ? Colors.white
                            : const Color(0xFF888888),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // Dropdown Modal
        if (_activeDropdown != null) _buildDropdownModal(state),
      ],
    );
  }

  Widget _buildFilterChip({
    required String label,
    required VoidCallback onTap,
    bool showArrow = false,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.surfaceElevated,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.inputBorder),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (showArrow) ...[
                const SizedBox(width: 4),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 14,
                  color: Colors.white,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _genderLabel(String? value) {
    if (value == null) return 'Any';
    return value[0].toUpperCase() + value.substring(1);
  }

  String _styleLabel(String? value) {
    if (value == null) return 'Any';
    if (value == '3d') return '3D';
    return value[0].toUpperCase() + value.substring(1);
  }

  Widget _buildDropdownModal(CharacterListState state) {
    String title;
    List<MapEntry<String, String?>> options;
    String? currentValue;

    if (_activeDropdown == 'sort') {
      title = 'Sort By';
      options = _sortOptions.map((o) => MapEntry(_sortLabels[o]!, o)).toList();
      currentValue = state.filters['sort'] ?? 'popular';
    } else if (_activeDropdown == 'gender') {
      title = 'Filter Gender';
      options = [
        const MapEntry('Any', null),
        ...AppConstants.characterGenders.map((g) => MapEntry(g.label, g.value)),
      ];
      currentValue = state.filters['gender'];
    } else {
      title = 'Filter Style';
      options = [
        const MapEntry('Any', null),
        ...AppConstants.characterStyles.map((s) => MapEntry(s.label, s.value)),
      ];
      currentValue = state.filters['style'];
    }

    return Container(
      color: Colors.black.withValues(alpha: 0.7),
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: AppBorderRadius.xl,
            border: Border.all(color: AppColors.cardBorder),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.lg,
                  AppSpacing.lg,
                  AppSpacing.sm,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() => _activeDropdown = null),
                      child: const Icon(
                        Icons.close,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              ...options.map(
                (opt) => GestureDetector(
                  onTap: () =>
                      _handleDropdownSelect(_activeDropdown!, opt.value),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.md,
                    ),
                    decoration: currentValue == opt.value
                        ? BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.transparent),
                          )
                        : null,
                    margin: EdgeInsets.symmetric(
                      horizontal: currentValue == opt.value ? AppSpacing.sm : 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          opt.key,
                          style: TextStyle(
                            fontSize: 16,
                            color: currentValue == opt.value
                                ? AppColors.textPrimary
                                : AppColors.textSecondary,
                            fontWeight: currentValue == opt.value
                                ? FontWeight.w700
                                : FontWeight.w400,
                          ),
                        ),
                        if (currentValue == opt.value)
                          const Icon(
                            Icons.check,
                            size: 20,
                            color: AppColors.primary,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCharacterCard(Character character) {
    return GestureDetector(
      onTap: () => context.push('/character/${character.id}'),
      child: ClipRRect(
        borderRadius: AppBorderRadius.large,
        child: Container(
          decoration: const BoxDecoration(color: Color(0xFF1A1A2E)),
          child: Stack(
            children: [
              // Background image
              Positioned.fill(
                child: character.avatarUrl != null
                    ? CachedNetworkImage(
                        imageUrl: character.avatarUrl!,
                        fit: BoxFit.cover,
                        errorWidget: (_, __, ___) =>
                            Container(color: AppColors.surface),
                      )
                    : Container(color: AppColors.surface),
              ),

              // Gradient overlay
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 260,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Color(0x99000000),
                        Color(0xF2000000),
                      ],
                      stops: [0, 0.5, 1],
                    ),
                  ),
                ),
              ),

              // NSFW badge
              if (character.isNsfw)
                Positioned(
                  top: AppSpacing.sm,
                  right: AppSpacing.sm,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD92F74).withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      '18+',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              // Info
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        character.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        character.tagline ?? character.description ?? '',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFFDDDDDD),
                          height: 16 / 12,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search, size: 48, color: Color(0xFF666666)),
          const SizedBox(height: 10),
          Text(
            'No companions found',
            style: TextStyle(
              fontSize: AppTypography.base,
              color: const Color(0xFF888888),
            ),
          ),
        ],
      ),
    );
  }
}
