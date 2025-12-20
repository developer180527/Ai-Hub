import 'package:flutter/material.dart';
import 'package:ai_hub/core/theme/app_theme.dart';

class ChatPanel extends StatelessWidget {
  const ChatPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundLight,
      child: Column(
        children: [
          // 1. Custom App Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildModelSelector(),
                _buildNotificationBell(context),
              ],
            ),
          ),

          // 2. Chat Display Area (Where messages will appear)
          const Expanded(
            child: Center(
              child: Text(
                "No messages yet. Start a conversation!",
                style: TextStyle(color: AppColors.iconGray),
              ),
            ),
          ),

          // 3. The New Functional Input Area
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
          const SnackBar(
            content: Text("Logs: System operational. Gemini 3.0 connected."),
          ),
        );
      },
    );
  }
}

class ChatInputArea extends StatefulWidget {
  const ChatInputArea({super.key});

  @override
  State<ChatInputArea> createState() => _ChatInputAreaState();
}

class _ChatInputAreaState extends State<ChatInputArea> {
  final TextEditingController _controller = TextEditingController();
  bool _isThinkerEnabled = true;

  void _handleSend() {
    if (_controller.text.trim().isNotEmpty) {
      print("Sending to LLM: ${_controller.text}");
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.inputBg,
        borderRadius: BorderRadius.circular(AppStyles.borderRadiusLarge),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Allows the box to wrap content
        children: [
          // 💡 Actual Text Box
          TextField(
            controller: _controller,
            maxLines: 4,
            minLines: 1,
            style: const TextStyle(color: AppColors.textDark, fontSize: 16),
            decoration: InputDecoration(
              hintText: "Ask Anything",
              hintStyle: TextStyle(color: AppColors.textDark.withOpacity(0.4)),
              border: InputBorder.none,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
            ),
          ),

          const SizedBox(height: 8),

          // Bottom Action Row
          Row(
            children: [
              // Tool Icons
              _inputActionIcon(Icons.add_circle_outline, "Attach"),
              _inputActionIcon(Icons.language, "Web Search"),
              _inputActionIcon(Icons.code, "Code Mode"),
              _inputActionIcon(Icons.text_fields, "Formatting"),

              const Spacer(),

              // Interactive Thinker Chip
              InkWell(
                onTap: () =>
                    setState(() => _isThinkerEnabled = !_isThinkerEnabled),
                borderRadius: BorderRadius.circular(12),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _isThinkerEnabled
                        ? AppColors.backgroundLight
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.backgroundLight.withOpacity(0.5),
                    ),
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
                      Text(
                        "Thinker",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: _isThinkerEnabled
                              ? AppColors.textDark
                              : AppColors.iconGray,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Actual Send Button
              IconButton.filled(
                onPressed: _handleSend,
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.textDark,
                  foregroundColor: AppColors.backgroundLight,
                ),
                icon: const Icon(Icons.send_rounded, size: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _inputActionIcon(IconData icon, String tooltip) {
    return IconButton(
      icon: Icon(icon, size: 20, color: AppColors.iconGray),
      tooltip: tooltip,
      onPressed: () => print("Clicked $tooltip"),
      padding: const EdgeInsets.only(right: 8),
      constraints: const BoxConstraints(), // Makes them tighter
    );
  }
}
