import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketool_finance/auth/controllers/login_controller.dart';

class InputField extends GetView<LoginController> {
  final String placeHolder;
  final bool isObscure;
  const InputField(this.placeHolder, this.isObscure,{super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.emailInput,
      decoration: InputDecoration(labelText: placeHolder),
      obscureText: isObscure,
    );
  }
}
