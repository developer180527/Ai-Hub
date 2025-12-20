import 'package:flutter/material.dart';
import 'features/workspace/user interface/mainshell.dart';
import 'core/theme/app_theme.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(1200, 800),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden, // This hides the title bar
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

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
