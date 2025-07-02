import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final Widget icon;
  final String text;
  final bool isObscure;
  final TextEditingController inputController;
  final String? Function(String?)? validator;
  
  const CustomTextField({
    super.key,
    required this.isObscure,
    required this.icon,
    required this.text,
    required this.inputController,
    this.validator
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: 280,
        height: 50,
        child: TextField(
          focusNode: _focusNode,
          controller: widget.inputController,
          obscureText: widget.isObscure,
          decoration: InputDecoration(
            prefixIcon: widget.icon,
            labelText: widget.text,
            labelStyle: TextStyle(
              fontSize: 16,
              fontFamily: "RobotoMono",
              fontWeight: FontWeight.bold,
              color: _isFocused ? Color(0xFF81C784) : Color(0xFF2E5C4B),
            ),
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
        ),
      ),
    );
  }
}
