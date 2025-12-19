import 'package:flutter/material.dart';

// --- Theme Constants based on the Figma Design ---
class AppColors {
  static const Color backgroundLight = Color(0xFFEAEAEA); // Main background
  static const Color sidebarBg = Color(0xFFD4D4D4); // Slightly darker sidebar
  static const Color inputBg = Color(0xFFBDBDBD); // Darker input area
  static const Color textDark = Color(0xFF2D2D2D);
  static const Color iconGray = Color(0xFF5F5F5F);
  static const Color highlightGray = Color(
    0xFFAAAAAA,
  ); // For selected items/chips
  static const Color windowRed = Color(0xFFFF5F57);
  static const Color windowYellow = Color(0xFFFFBD2E);
  static const Color windowGreen = Color(0xFF28C840);
}

class AppStyles {
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusSmall = 8.0;
  static const double sidebarWidth = 250.0;
}
