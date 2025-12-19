import 'package:flutter/material.dart';
import 'features/workspace/user interface/mainshell.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const AiWorkstationApp());
}

// --- Main App Widget ---
class AiWorkstationApp extends StatelessWidget {
  const AiWorkstationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Workstation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundLight,
        fontFamily: 'San Francisco', // Or Roboto on other platforms
        useMaterial3: true,
        iconTheme: const IconThemeData(color: AppColors.iconGray, size: 20),
      ),
      home: const MainLayoutShell(),
    );
  }
}
