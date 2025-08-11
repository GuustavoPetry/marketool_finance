import 'package:flutter/material.dart';

class DropdownOption<T> {
  final T value;
  final String label;

  DropdownOption({required this.value, required this.label});
}

class CustomSelectOperation<T> extends StatelessWidget {
  final String label;
  final List<DropdownOption<T>> options;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final FormFieldValidator<T>? validator;
  final Icon? icon;

  const CustomSelectOperation({
    super.key,
    required this.label,
    required this.options,
    this.value,
    this.onChanged,
    this.validator,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: DropdownButtonFormField<T>(
        iconEnabledColor: Colors.white,
        decoration: InputDecoration(
          labelText: label,
          hintStyle: TextStyle(fontSize: 22, color: Colors.white),
          prefixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.white.withValues(alpha: 0.15),
          filled: true,
          labelStyle: const TextStyle(color: Colors.white70),
        ),
        dropdownColor: Colors.grey[800],
        value: value,
        items: options
            .map(
              (opt) => DropdownMenuItem<T>(
                value: opt.value,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    opt.label,
                    style: TextStyle(
                      fontFamily: "RobotoMono",
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
