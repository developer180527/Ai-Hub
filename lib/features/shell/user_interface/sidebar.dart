import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ai_hub/core/theme/app_theme.dart';

class SidebarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;
  final VoidCallback onTogglePress;

  const SidebarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.onTogglePress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.sidebarBg,
      child: Column(
        children: [
          SizedBox(height: Platform.isMacOS ? 40.0 : 16.0),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.view_sidebar_outlined),
                  onPressed: onTogglePress,
                  tooltip: "Toggle Sidebar",
                ),
                IconButton(
                  icon: const Icon(Icons.edit_square),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // ... (User Profile & Chat History parts remain the same) ...
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(
                    'https://placekitten.com/100/100',
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  "User180527",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              itemCount: 10,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(
                      AppStyles.borderRadiusSmall,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),

          // 💡 UPDATED: Horizontal Separator Line
          Container(
            // For a horizontal line, 'height' determines its thickness.
            height: AppStyles.separatorThickness,
            color: AppColors.separatorBold,
            // 'width: double.infinity' tells it to stretch horizontally
            // to fill all available space in this Column.
            width: double.infinity,
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.bar_chart_rounded),
                _buildNavItem(1, Icons.chat_bubble_outline_rounded),
                _buildNavItem(2, Icons.inventory_2_outlined),
                _buildNavItem(3, Icons.settings_outlined),
              ],
            ),
          ),
          SizedBox(height: Platform.isIOS || Platform.isAndroid ? 16.0 : 0),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    final isSelected = selectedIndex == index;
    return IconButton(
      icon: Icon(
        icon,
        color: isSelected ? AppColors.textDark : AppColors.iconGray,
        size: 28,
      ),
      onPressed: () => onItemSelected(index),
    );
  }
}
