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
    required this.text,
    required this.icon,
    required this.type,
    required this.isObscure,
    required this.inputController,
    required this.inputValidator,
    this.errorText,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 280,
        child: TextFormField(
          focusNode: _focusNode,
          controller: widget.inputController,
          decoration: InputDecoration(
            labelText: widget.text,
            errorText: widget.errorText,
            labelStyle: TextStyle(
              fontSize: 16,
              fontFamily: "RobotoMono",
              fontWeight: FontWeight.bold,
              color: _isFocused ? Colors.green : const Color(0xFF2E5C4B),
            ),
            prefixIcon: widget.icon,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: const Color(0xFF2E5C4B), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: const Color(0xFF2E5C4B), width: 1),
            ),
            fillColor: Color(0xFFE8F5E9),
            filled: true,
          ),
          obscureText: widget.isObscure,
          validator: widget.inputValidator,
        ),
      ),
    );
  }
}
