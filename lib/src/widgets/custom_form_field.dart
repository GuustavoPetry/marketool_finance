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
        width: 250,
        height: 50,
        child: TextFormField(
          controller: inputController,
          decoration: InputDecoration(
            labelText: text,
            prefixIcon: icon,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          obscureText: isObscure,
          validator: inputValidator,
        ),
      ),
    );
  }
}
