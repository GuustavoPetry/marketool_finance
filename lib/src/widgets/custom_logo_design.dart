import 'package:flutter/material.dart';

class LogoDesignWidget extends StatelessWidget {
  const LogoDesignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 40),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              "assets/images/lightLogo.png",
              width: 300,
              height: 250,
              )
          ),
        ],
      ),
    );
  }
}