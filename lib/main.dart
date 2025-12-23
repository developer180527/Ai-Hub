import 'package:flutter/material.dart';
import 'features/shell/user_interface/mainshell.dart';
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
    titleBarStyle:
        TitleBarStyle.hidden, // Hides native title bar for that clean look
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    // 💡 THE FIX: Set the minimum window constraints
    // This prevents the UI from "crashing" if the window is resized too small.
    await windowManager.setMinimumSize(const Size(800, 600));

    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const AiWorkstationApp());
}

class AiWorkstationApp extends StatelessWidget {
  const AiWorkstationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Workstation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundLight, //
        fontFamily: 'San Francisco',
        useMaterial3: true,
        iconTheme: const IconThemeData(color: AppColors.iconGray, size: 20),
      ),
      home: const MainLayoutShell(), //
    );
  }
}
