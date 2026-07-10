import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_border_radius.dart';
import '../../../core/services/premium_service.dart';
import '../../../core/constants/app_constants.dart';
import '../../../shared/models/index.dart';

final imageGenerationProvider =
    NotifierProvider<ImageGenerationNotifier, ImageGenerationState>(
      ImageGenerationNotifier.new,
    );

class ImageGenerationState {
  final bool isLoading;
  final bool isGenerating;
  final String? error;
  final List<GenerationRequest> history;

  ImageGenerationState({
    this.isLoading = false,
    this.isGenerating = false,
    this.error,
    this.history = const [],
  });

  ImageGenerationState copyWith({
    bool? isLoading,
    bool? isGenerating,
    String? error,
    List<GenerationRequest>? history,
  }) {
    return ImageGenerationState(
      isLoading: isLoading ?? this.isLoading,
      isGenerating: isGenerating ?? this.isGenerating,
      error: error ?? this.error,
      history: history ?? this.history,
    );
  }
}

class ImageGenerationNotifier extends Notifier<ImageGenerationState> {
  @override
  ImageGenerationState build() => ImageGenerationState();

  Future<void> generateImage(String prompt, String? style) async {
    state = state.copyWith(isGenerating: true, error: null);
    try {
      await PremiumService.instance.generateImage(prompt, style: style);
      await fetchHistory();
    } catch (e) {
      state = state.copyWith(isGenerating: false, error: e.toString());
      rethrow;
    }
  }

  Future<void> fetchHistory() async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await PremiumService.instance.getGenerations();
      state = state.copyWith(history: result.data, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}

class ImageGenerationScreen extends ConsumerStatefulWidget {
  const ImageGenerationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ImageGenerationScreen> createState() =>
      _ImageGenerationScreenState();
}

class _ImageGenerationScreenState extends ConsumerState<ImageGenerationScreen> {
  final _promptController = TextEditingController();
  String _selectedStyle = 'vivid';

  static const _styleOptions = [
    {'value': 'vivid', 'label': '✨ Vivid'},
    {'value': 'natural', 'label': '🌿 Natural'},
    {'value': 'anime', 'label': '🎨 Anime'},
    {'value': 'fantasy', 'label': '🐉 Fantasy'},
    {'value': 'cyberpunk', 'label': '🤖 Cyberpunk'},
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(imageGenerationProvider.notifier).fetchHistory(),
    );
  }

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  Future<void> _handleGenerate() async {
    final prompt = _promptController.text.trim();
    if (prompt.isEmpty) return;

    try {
      await ref
          .read(imageGenerationProvider.notifier)
          .generateImage(prompt, _selectedStyle);
      _promptController.clear();
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Image generated!')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString().replaceFirst('Exception: ', ''))),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(imageGenerationProvider);
    final completedImages = state.history
        .where(
          (g) => g.status == GenerationStatus.completed && g.resultUrl != null,
        )
        .toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'AI Image Studio',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.auto_awesome, color: Color(0xFFF59E0B)),
            onPressed: () => context.push('/coins'),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.base),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: AppBorderRadius.xl,
                  border: Border.all(color: AppColors.cardBorder),
                ),
                padding: const EdgeInsets.all(AppSpacing.base),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _promptController,
                      maxLines: 3,
                      maxLength: 500,
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppColors.textPrimary,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Describe the image you want to create...',
                        hintStyle: TextStyle(color: AppColors.textMuted),
                        border: InputBorder.none,
                        counterStyle: TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Wrap(
                      spacing: AppSpacing.sm,
                      runSpacing: AppSpacing.sm,
                      children: _styleOptions.map((s) {
                        final isActive = _selectedStyle == s['value'];
                        return GestureDetector(
                          onTap: () =>
                              setState(() => _selectedStyle = s['value']!),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                              vertical: AppSpacing.sm,
                            ),
                            decoration: BoxDecoration(
                              color: isActive
                                  ? AppColors.primaryMuted
                                  : AppColors.surfaceLight,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: isActive
                                    ? AppColors.primary
                                    : AppColors.cardBorder,
                              ),
                            ),
                            child: Text(
                              s['label']!,
                              style: TextStyle(
                                fontSize: 11,
                                color: isActive
                                    ? AppColors.primaryLight
                                    : AppColors.textSecondary,
                                fontWeight: isActive
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    SizedBox(
                      width: double.infinity,
                      child: GestureDetector(
                        onTap:
                            _promptController.text.trim().isEmpty ||
                                state.isGenerating
                            ? null
                            : _handleGenerate,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppSpacing.md,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: AppBorderRadius.xl,
                            gradient: AppColors.primaryGradient,
                          ),
                          child: state.isGenerating
                              ? const Center(
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.auto_awesome,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: AppSpacing.sm),
                                    Text(
                                      'Generate (${AppConstants.imageGenCost} coins)',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                AppSpacing.base,
                AppSpacing.base,
                AppSpacing.base,
                AppSpacing.md,
              ),
              child: Text(
                'Your Gallery',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
          if (state.isLoading)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          else if (completedImages.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.image_outlined,
                      size: 48,
                      color: AppColors.textMuted,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    const Text(
                      'No images yet. Create your first one!',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.base),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = completedImages[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: AppBorderRadius.large,
                      border: Border.all(color: AppColors.cardBorder),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: item.resultUrl!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              errorWidget: (_, __, ___) => Container(
                                color: AppColors.surface,
                                child: const Icon(Icons.broken_image),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(AppSpacing.sm),
                          child: Text(
                            item.prompt,
                            style: const TextStyle(
                              fontSize: 11,
                              color: AppColors.textSecondary,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                }, childCount: completedImages.length),
              ),
            ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),
        ],
      ),
    );
  }
}
