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
    return Padding(
      padding: EdgeInsets.all(5),
      child: Center(
        child: Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2E7D32),
              foregroundColor: Colors.white,
              disabledBackgroundColor: const Color(0xFF2E7D32),
              disabledForegroundColor: Colors.white,
              minimumSize: const Size(200, 48),
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: "RobotoMono",
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
