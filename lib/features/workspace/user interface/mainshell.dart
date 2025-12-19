import 'package:flutter/material.dart';
import 'package:ai_hub/core/widgets/placeholder_panel.dart';
import 'package:ai_hub/features/workspace/user interface/chat_panel.dart';
import 'package:ai_hub/features/workspace/user interface/sidebar.dart';

// --- The Layout Shell holding persistent Sidebar + Polymorphic Main Panel ---
class MainLayoutShell extends StatefulWidget {
  const MainLayoutShell({super.key});

  @override
  State<MainLayoutShell> createState() => _MainLayoutShellState();
}

class _MainLayoutShellState extends State<MainLayoutShell> {
  // 0: Analytics, 1: Chats, 2: Inventory, 3: Settings
  int _selectedIndex = 1; // Default to Chat view as in design

  final List<Widget> _panels = const [
    PlaceholderPanel(title: "Analytics Panel"),
    ChatPanel(), // The complex panel from your design
    PlaceholderPanel(title: "Inventory Panel"),
    PlaceholderPanel(title: "Settings Panel"),
  ];

  void _onNavItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Persistent Sidebar
          SidebarWidget(
            selectedIndex: _selectedIndex,
            onItemSelected: _onNavItemSelected,
          ),
          // Vertical divider for visual separation
          Container(width: 1, color: Colors.grey.shade400),
          // Main Polymorphic Content Area
          Expanded(
            // IndexedStack keeps state of panels when switching
            child: IndexedStack(index: _selectedIndex, children: _panels),
          ),
        ],
      ),
    );
  }
}
