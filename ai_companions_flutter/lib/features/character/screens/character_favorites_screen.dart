// Character Favorites Screen - View and manage favorite characters

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_border_radius.dart';
import '../../../shared/widgets/loading_widget.dart';
import '../../../shared/widgets/empty_state_widget.dart';
import '../../../core/config/app_config.dart';
import '../../character/providers/character_provider.dart';

class CharacterFavoritesScreen extends ConsumerStatefulWidget {
  const CharacterFavoritesScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CharacterFavoritesScreen> createState() =>
      _CharacterFavoritesScreenState();
}

class _CharacterFavoritesScreenState
    extends ConsumerState<CharacterFavoritesScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(characterProvider.notifier).fetchFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(characterProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = (screenWidth / 200).floor().clamp(2, 4);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: state.isLoading
          ? const LoadingWidget()
          : state.favorites.isEmpty
          ? const EmptyStateWidget(
              message: 'No favorites yet',
              icon: Icons.favorite_border,
            )
          : GridView.builder(
              padding: const EdgeInsets.all(AppSpacing.base),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 0.75,
                crossAxisSpacing: AppSpacing.base,
                mainAxisSpacing: AppSpacing.base,
              ),
              itemCount: state.favorites.length,
              itemBuilder: (context, index) {
                final character = state.favorites[index];
                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: state.isLoading ? 0 : 1,
                  child: GestureDetector(
                    onTap: () => context.push('/character/${character.id}'),
                    child: ClipRRect(
                      borderRadius: AppBorderRadius.lg,
                      child: Container(
                        color: AppColors.surface,
                        child: Stack(
                          children: [
                            if (character.avatarUrl != null)
                              Image.network(
                                AppConfig.resolveImageUrl(character.avatarUrl!)!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            Positioned(
                              top: AppSpacing.sm,
                              right: AppSpacing.sm,
                              child: GestureDetector(
                                onTap: () => ref
                                    .read(characterProvider.notifier)
                                    .toggleFavorite(character.id),
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black87,
                                    ],
                                  ),
                                ),
                                padding: const EdgeInsets.all(AppSpacing.sm),
                                child: Text(
                                  character.name,
                                  style: AppTypography.bodyBold,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
