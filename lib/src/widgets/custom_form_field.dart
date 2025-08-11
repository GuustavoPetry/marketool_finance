import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String text;
  final Icon icon;
  final TextInputType type;
  final bool isObscure;
  final String? errorText;
  final TextEditingController inputController;
  final FormFieldValidator<String?> inputValidator;

  const CustomFormField({
    super.key,
    this.isObscure = false,
    required this.text,
    required this.icon,
    required this.type,
    required this.inputController,
    required this.inputValidator,
    this.errorText,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 280,
        child: TextFormField(
          controller: widget.inputController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: widget.text,
            errorText: widget.errorText,
            labelStyle: TextStyle(
              fontSize: 16,
              fontFamily: "RobotoMono",
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
            prefixIcon: widget.icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.white.withValues(alpha: 0.15),
            filled: true,
          ),
          obscureText: widget.isObscure,
          validator: widget.inputValidator,
        ),
      ),
    );
  }
}
