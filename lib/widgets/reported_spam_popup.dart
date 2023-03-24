import 'package:flutter/material.dart';

class ReportedSpamDialog extends StatelessWidget {
  const ReportedSpamDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Image.asset(
            "assets/success.gif",
            height: 100,
          ),
          const SizedBox(height: 20),
          const Text(
            "Spam reported, peace restored !",
          ),
        ],
      ),
    );
  }
}
