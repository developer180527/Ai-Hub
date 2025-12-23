import 'package:flutter/material.dart';
import 'package:ai_hub/core/theme/app_theme.dart';
import 'package:ai_hub/core/widgets/placeholder_panel.dart';
// 💡 PRO TIP: Rename your folder to user_interface (no spaces!)
import '../../chat/chat_panel.dart';
import 'sidebar.dart';

class MainLayoutShell extends StatefulWidget {
  const MainLayoutShell({super.key});

  @override
  State<MainLayoutShell> createState() => _MainLayoutShellState();
}

class _MainLayoutShellState extends State<MainLayoutShell> {
  int _selectedIndex = 1;
  double _sidebarWidth = AppStyles.defaultSidebarWidth;
  bool _isSidebarVisible = true;

  void _toggleSidebar() {
    setState(() {
      _isSidebarVisible = !_isSidebarVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 💡 FIX: Create the list right here. This ensures ChatPanel always
    // knows if the sidebar is visible every time the screen repaints.
    final List<Widget> currentPanels = [
      const PlaceholderPanel(title: "Analytics Panel"),
      ChatPanel(isSidebarVisible: _isSidebarVisible, onToggle: _toggleSidebar),
      const PlaceholderPanel(title: "Inventory Panel"),
      const PlaceholderPanel(title: "Settings Panel"),
    ];

    return Scaffold(
      body: Row(
        children: [
          // 1. Stable Sidebar
          if (_isSidebarVisible)
            SizedBox(
              width: _sidebarWidth,
              child: SidebarWidget(
                selectedIndex: _selectedIndex,
                onItemSelected: (i) => setState(() => _selectedIndex = i),
                onTogglePress: _toggleSidebar,
              ),
            ),

          // 2. Vertical Black Separator (Resizer)
          if (_isSidebarVisible)
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _sidebarWidth = (_sidebarWidth + details.delta.dx).clamp(
                    AppStyles.minSidebarWidth,
                    AppStyles.maxSidebarWidth,
                  );
                });
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.resizeLeftRight,
                child: Container(
                  width: AppStyles.separatorThickness, // 2.0
                  color: AppColors.separatorBold, // Deep Black
                ),
              ),
            ),

          // 3. Main Panel Area
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children:
                  currentPanels, // 💡 FIX: Use the variable 'currentPanels', not the method!
            ),
          ),
        ],
      ),
    );
  }
}
