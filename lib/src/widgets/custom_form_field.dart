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
      child: Container(
        alignment: Alignment.center,
        height: 45,
        child: TextFormField(
          controller: inputController,
          decoration: InputDecoration(
            labelText: text,
            border: OutlineInputBorder(),
            prefixIcon: icon,
          ),
          obscureText: isObscure,
          validator: inputValidator,
        ),
      ),
    );
  }
}
