import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final String? errorText;
  final String label;
  final Icon icon;
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime initialDate;
  final ValueChanged<DateTime> onChanged;

  const CustomDatePicker({
    super.key,
    required this.selectedDate,
    required this.label,
    required this.icon,
    required this.firstDate,
    required this.lastDate,
    required this.initialDate,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: firstDate,
          lastDate: lastDate,
        );
        if (picked != null) {
          onChanged(picked);
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          prefixIcon: icon,
          errorText: errorText,
        ),
        child: Text(
          '${selectedDate.day.toString().padLeft(2, '0')}/'
          '${selectedDate.month.toString().padLeft(2, '0')}/'
          '${selectedDate.year}',
        ),
      ),
    );
  }
}
