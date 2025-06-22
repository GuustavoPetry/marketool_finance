import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final String? errorText;
  final String label;
  final Icon icon;
  final DateTime firstDate;
  final DateTime lastDate;
  final ValueChanged<DateTime> onChanged;

  const CustomDatePicker({
    super.key,
    required this.selectedDate,
    required this.label,
    required this.icon,
    required this.firstDate,
    required this.lastDate,

    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        height: 50,
        child: TextFormField(
          readOnly: true,
          controller: TextEditingController(
            text:
                '${selectedDate.day.toString().padLeft(2, '0')}/'
                '${selectedDate.month.toString().padLeft(2, '0')}/'
                '${selectedDate.year}',
          ),
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: icon,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
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
        ),
      ),
    );
  }
}
