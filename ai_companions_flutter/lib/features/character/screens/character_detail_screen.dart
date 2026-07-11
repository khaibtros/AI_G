// Character Detail Screen - View character info and start chat

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_border_radius.dart';
import '../../../shared/widgets/loading_widget.dart';
import '../../../shared/widgets/empty_state_widget.dart';
import '../providers/character_provider.dart';
import '../../chat/providers/chat_provider.dart';

class CharacterDetailScreen extends ConsumerStatefulWidget {
  final String characterId;

  const CharacterDetailScreen({Key? key, required this.characterId})
    : super(key: key);

  @override
  ConsumerState<CharacterDetailScreen> createState() =>
      _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends ConsumerState<CharacterDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(characterProvider.notifier)
          .fetchCharacterById(widget.characterId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(characterProvider);
    final character = state.selectedCharacter;

    if (state.isLoading) {
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(backgroundColor: AppColors.background, elevation: 0),
        body: const LoadingWidget(),
      );
    }

    if (character == null) {
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(backgroundColor: AppColors.background, elevation: 0),
        body: const EmptyStateWidget(
          message: 'Character not found',
          icon: Icons.person_off_outlined,
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Share feature coming soon')),
              );
            },
          ),
          IconButton(
            icon: Icon(
              character.isFavorited == true
                  ? Icons.favorite
                  : Icons.favorite_outline,
            ),
            color: character.isFavorited == true ? Colors.red : null,
            onPressed: () => ref
                .read(characterProvider.notifier)
                .toggleFavorite(character.id),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar/Banner
            if (character.bannerUrl != null || character.avatarUrl != null)
              Container(
                height: 200,
                color: AppColors.surface,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (character.bannerUrl != null)
                      Image.network(character.bannerUrl!, fit: BoxFit.cover)
                    else if (character.avatarUrl != null)
                      Image.network(character.avatarUrl!, fit: BoxFit.cover),
                    if (character.avatarUrl != null)
                      Positioned(
                        bottom: -30,
                        left: AppSpacing.base,
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.background,
                              width: 4,
                            ),
                          ),
                          child: Image.network(
                            character.avatarUrl!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

            SizedBox(
              height: character.avatarUrl != null
                  ? AppSpacing.lg
                  : AppSpacing.base,
            ),

            // Name & Tagline
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.base),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(character.name, style: AppTypography.h2),
                      ),
                      if (character.isOfficial) ...[
                        SizedBox(width: AppSpacing.sm),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryMuted,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.check_circle,
                                size: 14,
                                color: AppColors.primary,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Official',
                                style: AppTypography.caption.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (character.tagline != null) ...[
                    SizedBox(height: AppSpacing.xs),
                    Text(
                      character.tagline!,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            SizedBox(height: AppSpacing.lg),

            // Stats
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.base),
              child: Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: [
                  _StatPill(
                    icon: Icons.chat_bubble_outline,
                    label: '${character.chatCount} chats',
                  ),
                  _StatPill(
                    icon: Icons.favorite_outline,
                    label: '${character.favoriteCount} likes',
                  ),
                  _StatPill(icon: null, label: character.style.displayName),
                  _StatPill(icon: null, label: character.gender.displayName),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.lg),

            // Categories
            if (character.categories.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.base,
                ),
                child: Wrap(
                  spacing: AppSpacing.sm,
                  children: character.categories
                      .map(
                        (cat) => Chip(
                          label: Text(cat, style: AppTypography.bodySmall),
                          backgroundColor: AppColors.primaryMuted,
                        ),
                      )
                      .toList(),
                ),
              ),

            SizedBox(height: AppSpacing.lg),

            // Description
            if (character.description != null) ...[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.base,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('About', style: AppTypography.h4),
                    SizedBox(height: AppSpacing.sm),
                    Text(
                      character.description!,
                      style: AppTypography.body.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.lg),
            ],

            // Personality
            if (character.personality.traits != null &&
                character.personality.traits!.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.base,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Personality', style: AppTypography.h4),
                    SizedBox(height: AppSpacing.sm),
                    Wrap(
                      spacing: AppSpacing.sm,
                      runSpacing: AppSpacing.sm,
                      children: character.personality.traits!
                          .map(
                            (trait) => Chip(
                              label: Text(
                                trait,
                                style: AppTypography.bodySmall,
                              ),
                              backgroundColor: AppColors.surface,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.lg),
            ],

            // Interests
            if (character.personality.interests != null &&
                character.personality.interests!.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.base,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Interests', style: AppTypography.h4),
                    SizedBox(height: AppSpacing.sm),
                    Wrap(
                      spacing: AppSpacing.sm,
                      runSpacing: AppSpacing.sm,
                      children: character.personality.interests!
                          .map(
                            (interest) => Chip(
                              label: Text(
                                interest,
                                style: AppTypography.bodySmall,
                              ),
                              backgroundColor: AppColors.surface,
                              side: BorderSide(color: AppColors.primaryMuted),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.lg),
            ],

            // Greeting Message
            if (character.greetingMessage.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.base,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('First Message', style: AppTypography.h4),
                    SizedBox(height: AppSpacing.sm),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: AppBorderRadius.lg,
                        border: Border.all(color: AppColors.cardBorder),
                      ),
                      child: Text(
                        character.greetingMessage,
                        style: AppTypography.body.copyWith(
                          fontStyle: FontStyle.italic,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.lg),
            ],

            SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(AppSpacing.base),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border(top: BorderSide(color: AppColors.surfaceBorder)),
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              try {
                final conversation = await ref
                    .read(chatProvider.notifier)
                    .startConversation(character.id);
                if (mounted) context.push('/chat/${conversation.id}');
              } catch (e) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(e.toString())));
              }
            },
            child: Text('Start Chat', style: AppTypography.button),
          ),
        ),
      ),
    );
  }
}

class _StatPill extends StatelessWidget {
  final IconData? icon;
  final String label;

  const _StatPill({this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: AppColors.textSecondary),
            SizedBox(width: 4),
          ],
          Text(label, style: AppTypography.caption),
        ],
      ),
    );
  }
}
