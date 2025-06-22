import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final Widget icon;
  final String text;
  final bool isObscure;
  final TextEditingController inputController;
  const CustomInputField({
    super.key,
    required this.isObscure,
    required this.icon,
    required this.text,
    required this.inputController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: 230,
        height: 50,
        child: TextField(
          controller: inputController,
          obscureText: isObscure,
          style: Theme.of(context).textTheme.labelMedium,
          decoration: InputDecoration(
            prefixIcon: icon,
            labelText: text,
            labelStyle: TextStyle(
              fontSize: 16,
              fontFamily: "RobotoMono",
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: const Color(0xFF2E7D32), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: const Color(0xFF2E7D32), width: 1),
            ),
            fillColor: Color(0xFFE8F5E9),
            filled: true,
          ),
        ),
      ),
    );
  }
}
