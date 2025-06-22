import 'package:flutter/material.dart';

class LogoDesignWidget extends StatelessWidget {
  const LogoDesignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          ClipRRect(
            child: Image.asset(
              "assets/images/dark_logo.png",
              width: 350,
              height: 250,
            ),
          ),
        ],
      ),
    );
  }
}
