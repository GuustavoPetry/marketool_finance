import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketool_finance/auth/controllers/login_controller.dart';

class InputField extends GetView<LoginController> {
  final String text;
  final bool isObscure;
  final TextEditingController inputController;
  const InputField({
    super.key, 
    required this.isObscure, 
    required this.text, 
    required this.inputController,
  });


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: inputController,
      decoration: InputDecoration(labelText: text),
      obscureText: isObscure,
    );
  }
}
