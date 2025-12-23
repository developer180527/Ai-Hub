import 'package:flutter/material.dart';
import 'package:ai_hub/core/theme/app_theme.dart';
import 'package:ai_hub/core/widgets/placeholder_panel.dart';
import 'chat_panel.dart';
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

  final List<Widget> _panels = const [
    PlaceholderPanel(title: "Analytics Panel"),
    ChatPanel(),
    PlaceholderPanel(title: "Inventory Panel"),
    PlaceholderPanel(title: "Settings Panel"),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 800;

        return Scaffold(
          // Drawer for Mobile
          drawer: isMobile
              ? Drawer(
                  child: SidebarWidget(
                    selectedIndex: _selectedIndex,
                    onItemSelected: (i) {
                      setState(() => _selectedIndex = i);
                      Navigator.pop(context);
                    },
                    onToggle: () => Navigator.pop(context),
                  ),
                )
              : null,
          body: isMobile ? _panels[_selectedIndex] : _buildDesktopLayout(),
        );
      },
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        // Sidebar with dynamic width
        if (_isSidebarVisible)
          SizedBox(
            width: _sidebarWidth,
            child: SidebarWidget(
              selectedIndex: _selectedIndex,
              onItemSelected: (i) => setState(() => _selectedIndex = i),
              onToggle: () => setState(() => _isSidebarVisible = false),
            ),
          ),

        // 💡 THE RESIZER HANDLE (The bold vertical line)
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
                width: 2, // Bold line thickness
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),

        // If sidebar hidden, show a small button to bring it back
        if (!_isSidebarVisible)
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => setState(() => _isSidebarVisible = true),
          ),

        // Main Panel
        Expanded(
          child: IndexedStack(index: _selectedIndex, children: _panels),
        ),
      ],
    );
  }
}
