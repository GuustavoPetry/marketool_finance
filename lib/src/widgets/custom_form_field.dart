import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String text;
  final Icon icon;
  final TextInputType type;
  final bool isObscure;
  final TextEditingController inputController;
  final FormFieldValidator<String?> inputValidator;

  const CustomFormField({
    super.key,
    required this.text,
    required this.icon,
    required this.type,
    required this.isObscure,
    required this.inputController,
    required this.inputValidator,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 230,
        height: 50,
        child: TextFormField(
          controller: inputController,
          decoration: InputDecoration(
            labelText: text,
            labelStyle: TextStyle(
              fontSize: 16,
              fontFamily: "RobotoMono",
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32),
            ),
            prefixIcon: icon,
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
          obscureText: isObscure,
          validator: inputValidator,
        ),
      ),
    );
  }
}
