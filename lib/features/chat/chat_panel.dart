import 'package:flutter/material.dart';
import 'package:ai_hub/core/theme/app_theme.dart';
import 'dart:io';

class ChatPanel extends StatelessWidget {
  final bool isSidebarVisible;
  final VoidCallback onToggle;

  const ChatPanel({
    super.key,
    required this.isSidebarVisible,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundLight,
      child: Column(
        children: [
          // 1. Adaptive Header (Mac Safe)
          Padding(
            padding: EdgeInsets.only(
              // 💡 Buffer for traffic lights when sidebar is closed
              left: (!isSidebarVisible && Platform.isMacOS) ? 80.0 : 16.0,
              right: 16.0,
              top: 12.0,
              bottom: 12.0,
            ),
            child: Row(
              children: [
                // 💡 Buttons reappear here when sidebar is hidden
                if (!isSidebarVisible) ...[
                  IconButton(
                    icon: const Icon(Icons.view_sidebar_outlined, size: 22),
                    onPressed: onToggle,
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_square, size: 20),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 8),
                ],

                _buildModelSelector(),
                const Spacer(),
                const Icon(
                  Icons.biotech_outlined,
                  size: 24,
                  color: AppColors.iconGray,
                ),
                const SizedBox(width: 12),
                const Icon(
                  Icons.notifications_none_rounded,
                  size: 24,
                  color: AppColors.iconGray,
                ),
              ],
            ),
          ),

          // Bold Black Line
          Container(
            height: AppStyles.separatorThickness,
            color: AppColors.separatorBold,
            width: double.infinity,
          ),

          const Expanded(
            child: Center(
              child: Text(
                "No messages yet. Start a conversation!",
                style: TextStyle(color: AppColors.iconGray),
              ),
            ),
          ),

          const ChatInputArea(),
        ],
      ),
    );
  }

  Widget _buildModelSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        // 💡 Use .withValues to satisfy the new Flutter rules!
        color: AppColors.highlightGray.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.textDark.withValues(alpha: 0.1)),
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
          Icon(Icons.keyboard_arrow_down, size: 16),
        ],
      ),
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

  @override
  Widget build(BuildContext context) {
    return Container(
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
            maxLines: 4,
            minLines: 1,
            decoration: const InputDecoration(
              hintText: "Ask Anything",
              border: InputBorder.none,
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.add_circle_outline,
                size: 20,
                color: AppColors.iconGray,
              ),
              const SizedBox(width: 12),
              const Icon(Icons.language, size: 20, color: AppColors.iconGray),
              const SizedBox(width: 12),
              const Icon(Icons.code, size: 20, color: AppColors.iconGray),
              const Spacer(),
              _buildThinkerChip(),
              const SizedBox(width: 12),
              // 💡 Fixed background color syntax
              IconButton.filled(
                onPressed: () => _controller.clear(),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.textDark,
                ),
                icon: const Icon(
                  Icons.send_rounded,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildThinkerChip() {
    return InkWell(
      onTap: () => setState(() => _isThinkerEnabled = !_isThinkerEnabled),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: _isThinkerEnabled
              ? AppColors.backgroundLight
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.textDark.withValues(alpha: 0.1)),
        ),
        child: const Row(
          children: [
            Icon(Icons.psychology, size: 16),
            SizedBox(width: 4),
            Text(
              "Thinker",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
