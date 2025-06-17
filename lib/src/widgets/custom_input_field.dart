import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String text;
  final bool isObscure;
  final TextEditingController inputController;
  const CustomInputField({
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
          ),
        ),
      ),
    );
  }
}
