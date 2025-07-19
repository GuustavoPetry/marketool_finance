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
    return Padding(
      padding: EdgeInsets.all(0),
      child: SizedBox(
        width: 230,
        height: 50,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 17,
              fontFamily: "RobotoMono",
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Color.fromARGB(255, 14, 54, 19),
            foregroundColor: Colors.white,
          ),
          label: Text(label),
          onPressed: onPressed,
          icon: icon,
        ),
      ),
    );
  }
}
