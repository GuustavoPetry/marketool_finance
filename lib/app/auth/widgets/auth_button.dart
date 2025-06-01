
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketool_finance/app/auth/controllers/login_controller.dart';
import 'package:marketool_finance/app/_core/routes/app_routes.dart';

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
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            if (isAuthButton) {
            controller.tryTologin();
            } else {
              Get.toNamed(AppRoutes.login);
            }
          },
          style: Theme.of(context).elevatedButtonTheme.style,
          child: Text(text, style: TextStyle(color: Colors.white)),
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
