
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketool_finance/app/auth/controllers/login_controller.dart';
import 'package:marketool_finance/core/routes/app_routes.dart';

class AuthButton extends GetView<LoginController> {
  final String text;
  final bool isAuthButton;
  const AuthButton ({
    super.key, 
    required this.isAuthButton,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            if (isAuthButton) {
            controller.tryTologin();
            } else {
              Get.toNamed(AppRoutes.login);
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
          child: Text(text, style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
