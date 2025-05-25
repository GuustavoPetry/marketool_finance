import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketool_finance/auth/controllers/login_controller.dart';

class PasswordField extends GetView<LoginController> {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.passwordInput,
      decoration: InputDecoration(labelText: "Password"),
      obscureText: true,
    );
  }
}
