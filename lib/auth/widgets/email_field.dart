import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketool_finance/auth/controllers/login_controller.dart';

class EmailField extends GetView<LoginController> {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.emailInput,
      decoration: InputDecoration(labelText: "Email"),
      obscureText: false,
    );
  }
}
