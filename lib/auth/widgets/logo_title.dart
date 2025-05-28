import 'package:flutter/material.dart';

class LogoTitle extends StatelessWidget {
  const LogoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "MarkeTool",
      /* aqui ta a parte de design do app */
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.blue[900],
        letterSpacing: 2,
      ),
    );
  }
}
