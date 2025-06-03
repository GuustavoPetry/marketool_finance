import 'package:marketool_finance/app/auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return SizedBox(
      width: 150,
      height: 50,
      child: TextField(
        controller: inputController,
        obscureText: isObscure,
        style: Theme.of(context).textTheme.bodySmall,
        decoration: InputDecoration(
          labelText: text,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          labelStyle: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
