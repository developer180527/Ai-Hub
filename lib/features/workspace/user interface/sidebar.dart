import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ai_hub/core/theme/app_theme.dart';

class SidebarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;
  final VoidCallback onToggle;

  const SidebarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.sidebarBg, // Ensure this isn't transparent!
      child: Column(
        children: [
          // Mac Traffic Light Gap
          SizedBox(height: Platform.isMacOS ? 40.0 : 20.0),

          // Top Controls
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.view_sidebar_outlined),
                  onPressed: onToggle,
                ),
                IconButton(
                  icon: const Icon(Icons.edit_square),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          // User Profile Row... (Add your profile code here)

          // History List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 8,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, __) => Container(
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),

          // 💡 THE BOLD HORIZONTAL LINE
          Container(
            height: 2, // Extra bold as requested
            color: const Color.fromARGB(255, 8, 8, 8),
            width: double.infinity,
          ),

          // Bottom Nav
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _navBtn(0, Icons.bar_chart),
                _navBtn(1, Icons.chat_bubble_outline),
                _navBtn(2, Icons.inventory_2_outlined),
                _navBtn(3, Icons.settings),
              ],
            ),
          ),
          SizedBox(height: Platform.isIOS ? 20 : 10),
        ],
      ),
    );
  }

  Widget _navBtn(int index, IconData icon) {
    bool active = selectedIndex == index;
    return IconButton(
      icon: Icon(icon, color: active ? AppColors.textDark : AppColors.iconGray),
      onPressed: () => onItemSelected(index),
    );
  }
}
