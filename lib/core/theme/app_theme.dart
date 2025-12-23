import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundLight = Color(0xFFEAEAEA);
  static const Color sidebarBg = Color(0xFFD4D4D4);
  static const Color inputBg = Color(0xFFBDBDBD);
  static const Color textDark = Color(0xFF2D2D2D);
  static const Color iconGray = Color(0xFF5F5F5F);
  static const Color highlightGray = Color(0xFFAAAAAA);
  // 💡 NEW: A much darker, bolder black for separators
  static const Color separatorBold = Color(0xFF212121);
}

class AppStyles {
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusSmall = 8.0;

  // Sidebar Sizing Constants
  static const double defaultSidebarWidth = 250.0;
  static const double minSidebarWidth = 200.0;
  static const double maxSidebarWidth = 500.0;

  // 💡 NEW: Standard thickness for all bold separator lines
  static const double separatorThickness = 2.0;
  // The width of the hit-test area for resizing (can be larger than the visual line)
  static const double resizeHandleWidth = 5.0;
}
