import 'package:flutter/material.dart';

class InputFormField extends StatelessWidget {
  final String text;
  final Icon icon;
  final TextInputType type;
  final bool isObscure;
  final TextEditingController inputController;
  final FormFieldValidator<String?> inputValidator;
  const InputFormField({
    super.key,
    required this.text,
    required this.icon,
    required this.type,
    required this.isObscure,
    required this.inputController,
    required this.inputValidator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      style: Theme.of(context).textTheme.bodySmall,
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(),
        prefixIcon: icon,
        labelStyle: Theme.of(context).textTheme.labelSmall,
      ),
      obscureText: isObscure,
      validator: inputValidator,
    );
  }
}
