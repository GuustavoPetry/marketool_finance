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
        width: 230,
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
            labelStyle: TextStyle(
              fontSize: 16,
              fontFamily: "RobotoMono",
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32),
            ),
            prefixIcon: icon,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: const Color(0xFF2E7D32), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: const Color(0xFF2E7D32), width: 1),
            ),
            fillColor: Color(0xFFE8F5E9),
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
