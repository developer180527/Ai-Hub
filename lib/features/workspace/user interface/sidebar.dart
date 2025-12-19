import 'package:flutter/material.dart';
import 'package:ai_hub/core/theme/app_theme.dart';

// --- The Sidebar Widget ---
class SidebarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const SidebarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppStyles.sidebarWidth,
      color: AppColors.sidebarBg,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      child: Column(
        children: [
          // 1. Window Controls & Top Icons
          Row(
            children: [
              const Row(
                children: [
                  Icon(Icons.circle, size: 12, color: AppColors.windowRed),
                  SizedBox(width: 8),
                  Icon(Icons.circle, size: 12, color: AppColors.windowYellow),
                  SizedBox(width: 8),
                  Icon(Icons.circle, size: 12, color: AppColors.windowGreen),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.view_sidebar_outlined),
                onPressed: () {},
              ),
              IconButton(icon: const Icon(Icons.edit_square), onPressed: () {}),
            ],
          ),
          const SizedBox(height: 20),
          // 2. User Profile
          const Row(
            children: [
              CircleAvatar(
                radius: 16,
                // Replace with actual image asset later
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
          const SizedBox(height: 20),
          // 3. Chat History Placeholders (Scrollable)
          Expanded(
            child: ListView.separated(
              itemCount: 10, // Number of placeholder items
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                // The gray rounded rectangles in your design
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
          // 4. Bottom Navigation Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.bar_chart_rounded), // Analytics
              _buildNavItem(1, Icons.chat_bubble_outline_rounded), // Chats
              _buildNavItem(2, Icons.inventory_2_outlined), // Inventory
              _buildNavItem(3, Icons.settings_outlined), // Settings
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    final isSelected = selectedIndex == index;
    return IconButton(
      icon: Icon(
        icon,
        // Make selected icon slightly darker/bolder visually
        color: isSelected ? AppColors.textDark : AppColors.iconGray,
        size: 24,
      ),
      onPressed: () => onItemSelected(index),
    );
  }
}
