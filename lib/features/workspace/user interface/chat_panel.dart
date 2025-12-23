import 'package:flutter/material.dart';
import 'package:ai_hub/core/theme/app_theme.dart';

class ChatPanel extends StatelessWidget {
  const ChatPanel({super.key});

  @override
  Widget build(BuildContext context) {
    // 💡 Check if we're on a narrow screen to decide if we show the menu button
    final bool isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      color: AppColors.backgroundLight,
      child: Column(
        children: [
          // 1. Custom App Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // 💡 MOBILE ONLY: The Menu Button to open the Sidebar Drawer
                if (isMobile)
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu, color: AppColors.textDark),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),

                if (isMobile) const SizedBox(width: 8),

                // Model Selector Pill (Main character of the header)
                _buildModelSelector(),

                const Spacer(),

                // Notification Bell
                _buildNotificationBell(context),
              ],
            ),
          ),

          // 2. Chat Display Area
          const Expanded(
            child: Center(
              child: Text(
                "No messages yet. Start a conversation!",
                style: TextStyle(color: AppColors.iconGray),
              ),
            ),
          ),

          // 3. Responsive Input Area
          const ChatInputArea(),
        ],
      ),
    );
  }

  Widget _buildModelSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.highlightGray,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.psychology_outlined, size: 18, color: AppColors.textDark),
          SizedBox(width: 8),
          Text(
            "Chat GPT 5.2",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationBell(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.notifications_none_rounded, size: 24),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Logs: System operational.")),
        );
      },
    );
  }
}

// --- The Input Area (Stateful for text handling) ---
class ChatInputArea extends StatefulWidget {
  const ChatInputArea({super.key});

  @override
  State<ChatInputArea> createState() => _ChatInputAreaState();
}

class _ChatInputAreaState extends State<ChatInputArea> {
  final TextEditingController _controller = TextEditingController();
  bool _isThinkerEnabled = true;

  @override
  Widget build(BuildContext context) {
    // 💡 Elastic width logic: Cap it at 800px on desktop, full width on mobile
    final bool isDesktop = MediaQuery.of(context).size.width > 800;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: isDesktop ? 800 : double.infinity,
        ),
        child: Container(
          margin: const EdgeInsets.all(24.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: AppColors.inputBg,
            borderRadius: BorderRadius.circular(AppStyles.borderRadiusLarge),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controller,
                maxLines: 5,
                minLines: 1,
                style: const TextStyle(color: AppColors.textDark, fontSize: 16),
                decoration: InputDecoration(
                  hintText: "Ask Anything",
                  hintStyle: TextStyle(
                    color: AppColors.textDark.withOpacity(0.4),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  // Tool Icons (Scrollable for small screens)
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _iconBtn(Icons.add_circle_outline, "Attach"),
                          _iconBtn(Icons.language, "Web"),
                          _iconBtn(Icons.code, "Code"),
                          _iconBtn(Icons.text_fields, "Format"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Thinker Chip
                  _buildThinkerChip(),
                  const SizedBox(width: 12),
                  // Send Button
                  _buildSendButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconBtn(IconData icon, String tip) => IconButton(
    icon: Icon(icon, size: 20, color: AppColors.iconGray),
    onPressed: () {},
    tooltip: tip,
  );

  Widget _buildThinkerChip() {
    return InkWell(
      onTap: () => setState(() => _isThinkerEnabled = !_isThinkerEnabled),
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: _isThinkerEnabled
              ? AppColors.backgroundLight
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.backgroundLight.withOpacity(0.5)),
        ),
        child: Row(
          children: [
            Icon(
              Icons.psychology,
              size: 16,
              color: _isThinkerEnabled
                  ? AppColors.textDark
                  : AppColors.iconGray,
            ),
            const SizedBox(width: 4),
            const Text(
              "Thinker",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSendButton() {
    return IconButton.filled(
      onPressed: () {
        if (_controller.text.isNotEmpty) {
          _controller.clear();
        }
      },
      style: IconButton.styleFrom(
        backgroundColor: AppColors.textDark,
        foregroundColor: AppColors.backgroundLight,
      ),
      icon: const Icon(Icons.send_rounded, size: 18),
    );
  }
}
