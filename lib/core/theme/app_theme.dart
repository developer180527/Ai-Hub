import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundLight = Color(0xFFEAEAEA);
  static const Color sidebarBg = Color(0xFFD4D4D4);
  static const Color inputBg = Color(0xFFBDBDBD);
  static const Color textDark = Color(0xFF2D2D2D);
  static const Color iconGray = Color(0xFF5F5F5F);
  static const Color highlightGray = Color(0xFFAAAAAA);

  // 💡 NEW: The Bold Separator Color
  static const Color separatorBold = Color(0xFF9E9E9E);

  static const Color windowRed = Color(0xFFFF5F57);
  static const Color windowYellow = Color(0xFFFFBD2E);
  static const Color windowGreen = Color(0xFF28C840);
}

class AppStyles {
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusSmall = 8.0;

  // 💡 NEW: Sidebar Constraints for resizing
  static const double defaultSidebarWidth = 260.0;
  static const double minSidebarWidth = 180.0;
  static const double maxSidebarWidth = 450.0;
}
