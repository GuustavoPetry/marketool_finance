import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget child;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.child = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2E7D32),
            foregroundColor: Colors.white,
          ),
          onPressed: onPressed,
          child: Text(text, style: const TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
