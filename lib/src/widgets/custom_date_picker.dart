import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
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

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/"
        "${date.month.toString().padLeft(2, '0')}/"
        "${date.year}";
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.text = _formatDate(widget.selectedDate);
    });
  }

  @override
  void didUpdateWidget(covariant CustomDatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDate != widget.selectedDate) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.controller.text = _formatDate(widget.selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 280,
        child: TextFormField(
          readOnly: true,
          controller: widget.controller,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: widget.label,
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
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: widget.initialDate,
              firstDate: widget.firstDate,
              lastDate: widget.lastDate,
            );
            if (picked != null) {
              widget.onChanged(picked);
            }
          },
        ),
      ),
    );
  }
}
