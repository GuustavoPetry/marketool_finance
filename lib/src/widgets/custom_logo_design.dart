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
              "assets/images/appLogo.png",
              width: 320,
              height: 200,
            ),
          ),
          ClipRRect(
            child: Image.asset(
              "assets/images/subLogo.png",
              width: 320,
              height: 25,
            ),
          ),
        ],
      ),
    );
  }
}
