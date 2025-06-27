import 'package:flutter/material.dart';

class LogoDesignWidget extends StatelessWidget {
  const LogoDesignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Center(
            child: ClipRRect(
              child: Image.asset(
                "assets/images/appLogo.png",
                width: 320,
                height: 200,
              ),
            ),
          ),
          Center(
            child: ClipRRect(
              child: Image.asset(
                "assets/images/subLogo.png",
                width: 310,
                height: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
