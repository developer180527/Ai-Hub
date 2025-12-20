import 'package:flutter/material.dart';
import 'package:ai_hub/core/theme/app_theme.dart';

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
      // 💡 Added 40px top padding to accommodate the native traffic lights
      padding: const EdgeInsets.only(
        top: 40.0,
        left: 12.0,
        right: 12.0,
        bottom: 16.0,
      ),
      child: Column(
        children: [
          // 1. Top Icons Row (Fake Traffic Lights DELETED)
          Row(
            children: [
              const Spacer(), // Pushes icons to the right side
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
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(
                  'https://placekitten.com/100/100',
                ),
              ),
              const SizedBox(width: 12),
              const Text(
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
          // 4. Bottom Navigation Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.bar_chart_rounded),
              _buildNavItem(1, Icons.chat_bubble_outline_rounded),
              _buildNavItem(2, Icons.inventory_2_outlined),
              _buildNavItem(3, Icons.settings_outlined),
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
        color: isSelected ? AppColors.textDark : AppColors.iconGray,
        size: 24,
      ),
      onPressed: () => onItemSelected(index),
    );
  }
}
