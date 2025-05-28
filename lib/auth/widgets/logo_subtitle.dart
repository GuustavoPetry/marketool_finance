import 'package:flutter/material.dart';

class LogoSubtitle extends StatelessWidget {
  const LogoSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Gestão de Investimentos",
      style: TextStyle(
        fontSize: 18,
        color: Colors.blueGrey[700],
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
