import 'package:flutter/material.dart';

class LogoDesign extends StatelessWidget {
  const LogoDesign({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 40),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              isDark ? "assets/dark_logo.png" : "assets/lightLogo.png",
              width: 300,
              height: 250,
              )
          ),

        ],
      ),
    );
  }
}
