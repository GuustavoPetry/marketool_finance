import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final Widget icon;
  final String text;
  final bool isObscure;
  final bool autoFocus;
  final TextEditingController inputController;
  const CustomTextField({
    super.key,
    this.isObscure = false,
    this.autoFocus = false,
    required this.icon,
    required this.text,
    required this.inputController,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: 280,
        height: 50,
        child: TextField(
          controller: widget.inputController,
          obscureText: widget.isObscure,
          autofocus: widget.autoFocus,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: widget.icon,
            labelText: widget.text,
            labelStyle: TextStyle(
              fontSize: 16,
              fontFamily: "RobotoMono",
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.white.withValues(alpha: 0.15),
            filled: true,
          ),
        ),
      ),
    );
  }
}
