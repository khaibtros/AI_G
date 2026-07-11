import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_companions_flutter/core/theme/app_colors.dart';
import 'package:ai_companions_flutter/core/theme/app_typography.dart';
import 'package:ai_companions_flutter/core/theme/app_spacing.dart';
import 'package:ai_companions_flutter/core/theme/app_border_radius.dart';
import 'package:ai_companions_flutter/features/character/providers/character_provider.dart';
import 'package:ai_companions_flutter/shared/models/character.dart';

class MyCharactersScreen extends ConsumerStatefulWidget {
  const MyCharactersScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MyCharactersScreen> createState() => _MyCharactersScreenState();
}

class _MyCharactersScreenState extends ConsumerState<MyCharactersScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(characterProvider.notifier).fetchMyCharacters();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(characterProvider);
    final myCharacters = state.myCharacters;
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = (screenWidth / 200).floor().clamp(2, 4);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('My Characters'),
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : myCharacters.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person_add_disabled_outlined,
                    size: 48,
                    color: AppColors.textMuted,
                  ),
                  const SizedBox(height: AppSpacing.base),
                  Text(
                    'You haven'
                    't created any characters yet',
                    style: AppTypography.body.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Create Character'),
                    onPressed: () => context.push('/character/create'),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(AppSpacing.base),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 0.75,
                crossAxisSpacing: AppSpacing.base,
                mainAxisSpacing: AppSpacing.base,
              ),
              itemCount: myCharacters.length,
              itemBuilder: (context, index) {
                final character = myCharacters[index];
                return _buildCharacterCard(context, character);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/character/create'),
        child: const Icon(Icons.add),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  Widget _buildCharacterCard(BuildContext context, Character character) {
    return GestureDetector(
      onTap: () => context.push('/character/${character.id}'),
      child: ClipRRect(
        borderRadius: AppBorderRadius.lg,
        child: Container(
          color: AppColors.surface,
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (character.avatarUrl != null)
                Image.network(
                  character.avatarUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.person,
                    size: 40,
                    color: AppColors.textMuted,
                  ),
                ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black87],
                    ),
                  ),
                  child: Text(
                    character.name,
                    style: AppTypography.bodyBold.copyWith(color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
