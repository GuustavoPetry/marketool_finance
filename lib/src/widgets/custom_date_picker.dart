import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final String label;
  final DateTime selectedDate;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Icon icon;
  final ValueChanged<DateTime> onChanged;
  final TextEditingController controller;

  const CustomDatePicker({
    super.key,
    required this.label,
    required this.initialDate,
    required this.selectedDate,
    required this.firstDate,
    required this.lastDate,
    required this.icon,
    required this.onChanged,
    required this.controller,
  });

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/"
        "${date.month.toString().padLeft(2, '0')}/"
        "${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    controller.text = _formatDate(selectedDate);
    return Center(
      child: SizedBox(
        width: 280,
        child: TextFormField(
          readOnly: true,
          controller: controller,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 16,
              fontFamily: "RobotoMono",
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
            prefixIcon: icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.white.withValues(alpha: 0.15),
            filled: true,
          ),
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: initialDate,
              firstDate: firstDate,
              lastDate: lastDate,
            );
            if (picked != null) {
              onChanged(picked);
            }
          },
        ),
      ),
    );
  }
}
