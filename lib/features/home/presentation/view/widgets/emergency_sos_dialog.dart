import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmergencySOSDialog extends StatelessWidget {
  const EmergencySOSDialog({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat(
      'hh:mm a – MMMM d, yyyy',
    ).format(DateTime.now());

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE53935),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 12),

                // Title
                const Expanded(
                  child: Text(
                    'Emergency SOS Activated',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            const Divider(color: Colors.white30),

            const SizedBox(height: 12),

            // Description
            const Text(
              'The patient has requested immediate assistance using the wearable device.',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),

            const SizedBox(height: 8),

            const Text(
              'Please respond as soon as possible.',
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),

            const SizedBox(height: 16),

            // Time
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                formattedDate,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),

            const SizedBox(height: 20),

            // Actions
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed:
                        onPressed ??
                        () {
                          // TODO:
                          // - Notify doctor
                          // - Open patient location
                          // - Start call
                          Navigator.pop(context);
                        },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Respond'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
