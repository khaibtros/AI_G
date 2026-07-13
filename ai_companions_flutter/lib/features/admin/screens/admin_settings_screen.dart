import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';

class AdminSettingsScreen extends StatelessWidget {
  const AdminSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Settings & Announcements'),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          _buildSectionHeader('Announcements'),
          SizedBox(height: AppSpacing.md),
          _buildAnnouncementCreator(context),
          SizedBox(height: AppSpacing.xl),
          _buildSectionHeader('Feature Flags'),
          SizedBox(height: AppSpacing.md),
          _buildFeatureFlagTile('Enable Image Generation', true, (val) {}),
          _buildFeatureFlagTile('New Character Style: "Vintage"', false, (val) {}),
          SizedBox(height: AppSpacing.xl),
          _buildSectionHeader('App Maintenance'),
          SizedBox(height: AppSpacing.md),
          _buildFeatureFlagTile('Enable Maintenance Mode', false, (val) {}),
          SizedBox(height: AppSpacing.md),
          TextField(
            style: AppTypography.body.copyWith(color: AppColors.textPrimary),
            decoration: InputDecoration(
              hintText: 'Maintenance message...',
              hintStyle: AppTypography.body.copyWith(color: AppColors.textMuted),
              filled: true,
              fillColor: AppColors.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.inputBorder),
              ),
            ),
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: AppTypography.h3.copyWith(color: AppColors.textPrimary),
    );
  }

  Widget _buildAnnouncementCreator(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: AppTypography.body.copyWith(color: AppColors.textPrimary),
            decoration: InputDecoration(
              hintText: 'Announcement title...',
              hintStyle: AppTypography.body.copyWith(color: AppColors.textMuted),
              filled: true,
              fillColor: AppColors.surfaceLight,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: AppSpacing.sm),
          TextField(
            style: AppTypography.body.copyWith(color: AppColors.textPrimary),
            decoration: InputDecoration(
              hintText: 'Announcement content...',
              hintStyle: AppTypography.body.copyWith(color: AppColors.textMuted),
              filled: true,
              fillColor: AppColors.surfaceLight,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            maxLines: 4,
          ),
          SizedBox(height: AppSpacing.md),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Post Announcement'),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureFlagTile(String title, bool value, ValueChanged<bool> onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTypography.body.copyWith(color: AppColors.textPrimary),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.success,
            inactiveThumbColor: AppColors.textMuted,
            inactiveTrackColor: AppColors.surfaceLight,
          ),
        ],
      ),
    );
  }
}
