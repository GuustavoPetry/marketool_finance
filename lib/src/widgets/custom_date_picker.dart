import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime selectedDate;
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
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 280,
        child: TextFormField(
          readOnly: true,
          controller: TextEditingController(
            text:
                '${selectedDate.day.toString().padLeft(2, '0')}/'
                '${selectedDate.month.toString().padLeft(2, '0')}/'
                '${selectedDate.year}',
          ),
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
