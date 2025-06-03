import 'package:marketool_finance/app/auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends GetView<LoginController> {
  final String text;
  final VoidCallback? onPressed; 

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed, 
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: Theme.of(context).elevatedButtonTheme.style,
          child: Text(text, style: const TextStyle(color: Colors.white)),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}