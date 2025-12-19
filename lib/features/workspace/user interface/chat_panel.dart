import 'package:flutter/material.dart';
import 'package:ai_hub/core/theme/app_theme.dart';

// --- The Main Chat Panel View ---
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
                // Model Selector Pill
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.highlightGray,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.psychology_outlined,
                        size: 18,
                        color: AppColors.textDark,
                      ),
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
                ),
                // Notification Bell
                IconButton(
                  icon: const Icon(Icons.notifications_none_rounded, size: 24),
                  onPressed: () {
                    // Show logs/notifications dialog
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Logs: API Key valid. No new models."),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // 2. Empty Chat Area (Expanded space)
          Expanded(child: Container()),
          // 3. Complex Input Area
          const ChatInputArea(),
        ],
      ),
    );
  }
}

// --- The Detailed Bottom Input Area ---
class ChatInputArea extends StatelessWidget {
  const ChatInputArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      height: 80, // Fixed height based on design visually
      decoration: BoxDecoration(
        color: AppColors.inputBg,
        borderRadius: BorderRadius.circular(AppStyles.borderRadiusLarge),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Placeholder Text
          Text(
            "Ask Anything",
            style: TextStyle(
              color: AppColors.textDark.withOpacity(0.5),
              fontSize: 16,
            ),
          ),
          // Bottom Icons Row
          Row(
            children: [
              // Left side icons
              const Icon(Icons.add_circle_outline, size: 20),
              const SizedBox(width: 12),
              const Icon(Icons.language, size: 20),
              const SizedBox(width: 12),
              const Icon(Icons.code, size: 20),
              const SizedBox(width: 12),
              const Icon(Icons.text_fields, size: 20),

              const Spacer(),

              // Right side: Thinker Chip & Send Button
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors
                      .backgroundLight, // Slightly lighter than input bg
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.psychology, size: 16),
                    SizedBox(width: 4),
                    Text(
                      "Thinker",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Send Button
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.textDark, // Dark circle
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.send_rounded,
                  size: 16,
                  color: AppColors.backgroundLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
