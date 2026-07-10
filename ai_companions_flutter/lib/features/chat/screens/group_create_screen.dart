import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_border_radius.dart';
import '../../character/providers/character_provider.dart';
import '../../../core/services/group_service.dart';

class GroupCreateScreen extends ConsumerStatefulWidget {
  const GroupCreateScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<GroupCreateScreen> createState() => _GroupCreateScreenState();
}

class _GroupCreateScreenState extends ConsumerState<GroupCreateScreen> {
  final Set<String> _selectedIds = {};
  bool _isCreating = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(characterProvider.notifier).fetchCharacters();
    });
  }

  void _toggleCharacter(String id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
      } else {
        if (_selectedIds.length < 5) {
          _selectedIds.add(id);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Maximum 5 characters per group')),
          );
        }
      }
    });
  }

  Future<void> _handleCreate() async {
    if (_selectedIds.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Choose at least 2 characters for a group')),
      );
      return;
    }

    setState(() => _isCreating = true);
    try {
      final conversation = await GroupService.instance.createGroup(_selectedIds.toList());
      if (mounted) {
        context.replace('/chat/${conversation.id}');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create group: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isCreating = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final characterState = ref.watch(characterProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Create Group Chat'),
        backgroundColor: AppColors.background,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Center(
              child: Text(
                '${_selectedIds.length}/5',
                style: AppTypography.body.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: characterState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.base),
                  child: Text(
                    'Select 2-5 characters to start a group conversation',
                    style: AppTypography.body.copyWith(color: AppColors.textSecondary),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(AppSpacing.base),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: AppSpacing.sm,
                      mainAxisSpacing: AppSpacing.sm,
                    ),
                    itemCount: characterState.characters.length,
                    itemBuilder: (context, index) {
                      final character = characterState.characters[index];
                      final isSelected = _selectedIds.contains(character.id);
                      return GestureDetector(
                        onTap: () => _toggleCharacter(character.id),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primaryMuted : AppColors.surface,
                            borderRadius: AppBorderRadius.lg,
                            border: Border.all(color: isSelected ? AppColors.primary : Colors.transparent, width: 2),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: character.avatarUrl != null ? NetworkImage(character.avatarUrl!) : null,
                                child: character.avatarUrl == null ? Text(character.name[0]) : null,
                              ),
                              SizedBox(height: AppSpacing.sm),
                              Text(character.name, maxLines: 1, overflow: TextOverflow.ellipsis),
                              if (isSelected) const Icon(Icons.check_circle, color: AppColors.primary),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.base),
                  child: ElevatedButton(
                    onPressed: _selectedIds.length < 2 || _isCreating ? null : _handleCreate,
                    child: _isCreating ? const CircularProgressIndicator() : Text('Create Group (${_selectedIds.length} characters)'),
                  ),
                ),
              ],
            ),
    );
  }
}
