import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_border_radius.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/services/upload_service.dart';
import '../../../shared/models/index.dart';
import '../providers/character_provider.dart';

class CharacterCreateScreen extends ConsumerStatefulWidget {
  const CharacterCreateScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CharacterCreateScreen> createState() =>
      _CharacterCreateScreenState();
}

class _CharacterCreateScreenState extends ConsumerState<CharacterCreateScreen> {
  int _step = 1;
  bool _isLoading = false;

  final _nameController = TextEditingController();
  final _taglineController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _backstoryController = TextEditingController();
  final _greetingController = TextEditingController();
  final _systemPromptController = TextEditingController();
  final _hairColorController = TextEditingController();
  final _eyeColorController = TextEditingController();
  final _outfitController = TextEditingController();
  final _bodyTypeController = TextEditingController();
  final _distFeaturesController = TextEditingController();
  final _ageAppearanceController = TextEditingController();

  String? _avatarUrl;
  String? _selectedStyle = 'anime';
  String? _selectedGender = 'female';
  Set<String> _selectedCategories = {};
  Set<String> _selectedTraits = {};
  Set<String> _selectedInterests = {};
  String _communicationStyle = AppConstants.communicationStyles.first;
  String _speakingTone = AppConstants.speakingTones.first;
  bool _isNsfw = false;

  @override
  void dispose() {
    _nameController.dispose();
    _taglineController.dispose();
    _descriptionController.dispose();
    _backstoryController.dispose();
    _greetingController.dispose();
    _systemPromptController.dispose();
    _hairColorController.dispose();
    _eyeColorController.dispose();
    _outfitController.dispose();
    _bodyTypeController.dispose();
    _distFeaturesController.dispose();
    _ageAppearanceController.dispose();
    super.dispose();
  }

  Future<void> _pickAvatar() async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
    );
    if (picked == null) return;
    setState(() => _isLoading = true);
    try {
      final url = await UploadService.instance.uploadImage(
        File(picked.path),
        prefix: 'avatars',
      );
      setState(() => _avatarUrl = url);
    } catch (e) {
      if (mounted)
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Upload failed: $e')));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  String? _validateStep() {
    if (_step == 1) {
      if (_nameController.text.trim().isEmpty) return 'Name is required';
      if (_taglineController.text.trim().isEmpty) return 'Tagline is required';
      if (_selectedCategories.isEmpty) return 'Select at least one category';
    }
    return null;
  }

  void _handleNext() {
    final error = _validateStep();
    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
      return;
    }
    setState(() => _step++);
  }

  String _generateDefaultAvatarUrl(String name) {
    final encodedName = Uri.encodeComponent(name);
    const colors = [
      'a855f7', 'ef4444', '10b981', '3b82f6', 'f97316',
      'ec4899', '06b6d4', '8b5cf6', 'f59e0b', '14b8a6',
    ];
    final color = colors[name.hashCode.abs() % colors.length];
    return 'https://ui-avatars.com/api/?name=$encodedName&background=$color&color=fff&size=512';
  }

  Future<void> _handleCreate() async {
    setState(() => _isLoading = true);
    try {
      final name = _nameController.text.trim();
      final avatarUrl = _avatarUrl ?? _generateDefaultAvatarUrl(name);
      final request = CreateCharacterRequest(
        name: name,
        tagline: _taglineController.text.trim(),
        description: _descriptionController.text.trim(),
        avatarUrl: avatarUrl,
        style: _selectedStyle,
        gender: _selectedGender,
        categories: _selectedCategories.toList(),
        isNsfw: _isNsfw,
        systemPrompt: _systemPromptController.text.trim(),
        greetingMessage: _greetingController.text.trim(),
        personality: CharacterPersonality(
          traits: _selectedTraits.toList(),
          interests: _selectedInterests.toList(),
          communicationStyle: _communicationStyle,
          speakingTone: _speakingTone,
          backstory: _backstoryController.text.trim(),
          quirks: [],
          likes: [],
          dislikes: [],
        ),
        appearance: CharacterAppearance(
          hairColor: _hairColorController.text.trim(),
          eyeColor: _eyeColorController.text.trim(),
          bodyType: _bodyTypeController.text.trim(),
          outfit: _outfitController.text.trim(),
          distinguishingFeatures: _distFeaturesController.text.trim(),
          ageAppearance: _ageAppearanceController.text.trim(),
        ),
      );
      await ref.read(characterProvider.notifier).createCharacter(request);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Companion created successfully!')),
        );
        context.go('/discover');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create companion: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildStepIndicator(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 120),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.base,
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: _step == 1
                        ? _buildStep1()
                        : _step == 2
                        ? _buildStep2()
                        : _buildStep3(),
                  ),
                ),
              ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.base,
        vertical: AppSpacing.md,
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
            onPressed: () =>
                _step > 1 ? setState(() => _step--) : context.pop(),
          ),
          const Spacer(),
          Text(
            'Create Companion',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const Spacer(),
          const SizedBox(width: 24),
        ],
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (i) {
          final stepNum = i + 1;
          final isActive = _step >= stepNum;
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: isActive ? 24 : 10,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: isActive ? AppColors.primary : AppColors.surfaceLight,
                ),
              ),
              if (i < 2)
                Container(
                  width: 40,
                  height: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  color: _step > stepNum
                      ? AppColors.primary
                      : AppColors.surfaceLight,
                ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildStep1() {
    return Column(
      key: const ValueKey(1),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.md),
        const Text(
          'Basic Info',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Center(
          child: GestureDetector(
            onTap: _isLoading ? null : _pickAvatar,
            child: Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.surface,
                    border: Border.all(color: AppColors.cardBorder),
                    image: _avatarUrl != null
                        ? DecorationImage(
                            image: NetworkImage(_avatarUrl!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: _avatarUrl == null
                      ? const Icon(
                          Icons.camera_alt,
                          size: 32,
                          color: AppColors.textMuted,
                        )
                      : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        const Center(
          child: Text(
            'Tap to upload avatar',
            style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        _buildLabel('Name *'),
        _buildInput(_nameController, 'e.g. Luna Nightfall'),
        const SizedBox(height: AppSpacing.base),
        _buildLabel('Tagline * (Short hook)'),
        _buildInput(
          _taglineController,
          'e.g. A mysterious vampire queen',
          maxLength: 100,
        ),
        const SizedBox(height: AppSpacing.base),
        _buildLabel('Description'),
        _buildInput(
          _descriptionController,
          'Describe their overall character...',
          maxLines: 4,
        ),
        const SizedBox(height: AppSpacing.lg),
        _buildLabel('Style & Gender'),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Visual Style',
          style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          children: AppConstants.characterStyles
              .map(
                (s) => _buildMiniChip(
                  s.label,
                  _selectedStyle == s.value,
                  () => setState(() => _selectedStyle = s.value),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          'Gender',
          style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          children: AppConstants.characterGenders
              .map(
                (g) => _buildMiniChip(
                  g.label,
                  _selectedGender == g.value,
                  () => setState(() => _selectedGender = g.value),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: AppSpacing.xl),
        _buildLabel('Categories * (Select up to 3)'),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: AppConstants.categories.map((cat) {
            final isSelected = _selectedCategories.contains(cat);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _selectedCategories.remove(cat);
                  } else if (_selectedCategories.length < 3) {
                    _selectedCategories.add(cat);
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: isSelected
                      ? AppColors.primaryMuted
                      : AppColors.surface,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.cardBorder,
                  ),
                ),
                child: Text(
                  cat,
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected
                        ? AppColors.primaryLight
                        : AppColors.textSecondary,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildStep2() {
    return Column(
      key: const ValueKey(2),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.md),
        const Text(
          'Personality & Voice',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _buildLabel('Traits (Select multiple)'),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: AppConstants.personalityTraits.map((trait) {
            final isSelected = _selectedTraits.contains(trait);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _selectedTraits.remove(trait);
                  } else {
                    _selectedTraits.add(trait);
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: isSelected
                      ? AppColors.primaryMuted
                      : AppColors.surface,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.cardBorder,
                  ),
                ),
                child: Text(
                  trait,
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected
                        ? AppColors.primaryLight
                        : AppColors.textSecondary,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: AppSpacing.xl),
        _buildLabel('Interests (Select multiple)'),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: AppConstants.interests.map((interest) {
            final isSelected = _selectedInterests.contains(interest);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _selectedInterests.remove(interest);
                  } else {
                    _selectedInterests.add(interest);
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: isSelected
                      ? AppColors.primaryMuted
                      : AppColors.surface,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.cardBorder,
                  ),
                ),
                child: Text(
                  interest,
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected
                        ? AppColors.primaryLight
                        : AppColors.textSecondary,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: AppSpacing.xl),
        _buildLabel('Communication Style'),
        const SizedBox(height: AppSpacing.sm),
        ...AppConstants.communicationStyles.map(
          (style) => GestureDetector(
            onTap: () => setState(() => _communicationStyle = style),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: AppSpacing.sm),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                borderRadius: AppBorderRadius.lg,
                color: _communicationStyle == style
                    ? AppColors.primaryMuted
                    : AppColors.surface,
                border: Border.all(
                  color: _communicationStyle == style
                      ? AppColors.primary
                      : AppColors.cardBorder,
                ),
              ),
              child: Text(
                style,
                style: TextStyle(
                  color: _communicationStyle == style
                      ? AppColors.primaryLight
                      : AppColors.textSecondary,
                  fontWeight: _communicationStyle == style
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _buildLabel('Speaking Tone'),
        const SizedBox(height: AppSpacing.sm),
        ...AppConstants.speakingTones.map(
          (tone) => GestureDetector(
            onTap: () => setState(() => _speakingTone = tone),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: AppSpacing.sm),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                borderRadius: AppBorderRadius.lg,
                color: _speakingTone == tone
                    ? AppColors.primaryMuted
                    : AppColors.surface,
                border: Border.all(
                  color: _speakingTone == tone
                      ? AppColors.primary
                      : AppColors.cardBorder,
                ),
              ),
              child: Text(
                tone,
                style: TextStyle(
                  color: _speakingTone == tone
                      ? AppColors.primaryLight
                      : AppColors.textSecondary,
                  fontWeight: _speakingTone == tone
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _buildLabel('Backstory'),
        _buildInput(
          _backstoryController,
          'What made them who they are today?',
          maxLines: 4,
        ),
      ],
    );
  }

  Widget _buildStep3() {
    return Column(
      key: const ValueKey(3),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.md),
        const Text(
          'Physical Appearance',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _buildLabel('Hair Color'),
        _buildInput(
          _hairColorController,
          'e.g. Jet black with crimson highlights',
        ),
        const SizedBox(height: AppSpacing.base),
        _buildLabel('Eye Color'),
        _buildInput(_eyeColorController, 'e.g. Deep red'),
        const SizedBox(height: AppSpacing.base),
        _buildLabel('Outfit Details'),
        _buildInput(_outfitController, 'e.g. Gothic silk gown'),
        const SizedBox(height: AppSpacing.base),
        _buildLabel('Body Type'),
        _buildInput(_bodyTypeController, 'e.g. Slender and athletic'),
        const SizedBox(height: AppSpacing.base),
        _buildLabel('Distinguishing Features'),
        _buildInput(
          _distFeaturesController,
          'e.g. A glowing scar over her eye',
        ),
        const SizedBox(height: AppSpacing.base),
        _buildLabel('Age Appearance'),
        _buildInput(_ageAppearanceController, 'e.g. 24'),
        const SizedBox(height: AppSpacing.xl),
        const Text(
          'Greeting Message',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'This is the first message they say to you.',
          style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
        ),
        const SizedBox(height: AppSpacing.sm),
        _buildInput(
          _greetingController,
          '*Luna smiles deviously as you enter the room* Welcome, mortal...',
          maxLines: 3,
        ),
        const SizedBox(height: AppSpacing.xl),
        const Text(
          'System Prompt',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Optional: override or extend rules for the LLM to follow when acting as this character.',
          style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
        ),
        const SizedBox(height: AppSpacing.sm),
        _buildInput(
          _systemPromptController,
          'Roleplay instructions (e.g. You must never break character...)',
          maxLines: 5,
        ),
        const SizedBox(height: AppSpacing.lg),
        GestureDetector(
          onTap: () => setState(() => _isNsfw = !_isNsfw),
          child: Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: AppBorderRadius.lg,
            ),
            child: Row(
              children: [
                Icon(
                  _isNsfw ? Icons.check_circle : Icons.circle_outlined,
                  size: 24,
                  color: _isNsfw ? AppColors.error : AppColors.textMuted,
                ),
                const SizedBox(width: AppSpacing.md),
                Text(
                  'This character contains NSFW content',
                  style: TextStyle(
                    fontSize: 13,
                    color: _isNsfw ? AppColors.error : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.base),
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: AppColors.divider)),
      ),
      child: Row(
        children: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text(
              'Cancel',
              style: TextStyle(color: AppColors.textMuted),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: _step < 3
                ? GestureDetector(
                    onTap: _handleNext,
                    child: Container(
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: AppBorderRadius.xl,
                        gradient: AppColors.primaryGradient,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Next Step',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: AppSpacing.sm),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: _isLoading ? null : _handleCreate,
                    child: Container(
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: AppBorderRadius.xl,
                        gradient: AppColors.primaryGradient,
                      ),
                      child: Center(
                        child: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                'Create Companion',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildInput(
    TextEditingController controller,
    String hint, {
    int maxLines = 1,
    int? maxLength,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      style: const TextStyle(fontSize: 15, color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textMuted),
        filled: true,
        fillColor: AppColors.inputBg,
        border: OutlineInputBorder(
          borderRadius: AppBorderRadius.lg,
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.base,
          vertical: AppSpacing.md,
        ),
        counterText: '',
      ),
    );
  }

  Widget _buildMiniChip(String label, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          borderRadius: AppBorderRadius.md,
          color: isActive ? AppColors.primary : AppColors.surface,
          border: Border.all(
            color: isActive ? AppColors.primary : AppColors.cardBorder,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: isActive ? Colors.white : AppColors.textSecondary,
            fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
