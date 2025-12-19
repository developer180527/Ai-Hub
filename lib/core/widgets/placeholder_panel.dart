import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// --- Simple Placeholder for non-active panels ---
class PlaceholderPanel extends StatelessWidget {
  final String title;
  const PlaceholderPanel({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundLight,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 24, color: AppColors.iconGray),
        ),
      ),
    );
  }
}
