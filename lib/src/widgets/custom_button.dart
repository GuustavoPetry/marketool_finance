import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Widget icon;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
            fontSize: 18,
            fontFamily: "RobotoMono",
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: const Color(0xFF2E7D32),
          foregroundColor: Colors.white,
          disabledBackgroundColor: const Color(0xFF2E7D32),
          disabledForegroundColor: Colors.white,
          shadowColor: Colors.black,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        label: Text(label),
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
