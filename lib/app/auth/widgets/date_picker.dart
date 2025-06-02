import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePicker extends StatelessWidget {
  final Rxn<DateTime> selectedDate;
  final RxnString errorText;
  final String label;
  final Icon icon;
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime initialDate;
  final VoidCallback? onChanged;

  const DatePicker({
    super.key,
    required this.selectedDate,
    required this.errorText,
    required this.label,
    required this.icon,
    required this.firstDate,
    required this.lastDate,
    required this.initialDate,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () async {
          final picked = await showDatePicker(
            context: context,
            initialDate: selectedDate.value ?? initialDate,
            firstDate: firstDate,
            lastDate: lastDate,
          );
          if (picked != null) {
            selectedDate.value = picked;
            errorText.value = null;
            if (onChanged != null) onChanged!();
          }
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            prefixIcon: icon,
            labelStyle: Theme.of(context).textTheme.labelSmall,
            errorText: errorText.value,
          ),
          child: Text(
            selectedDate.value == null
                ? 'Selecione sua $label'
                : '${selectedDate.value!.day.toString().padLeft(2, '0')}/'
                  '${selectedDate.value!.month.toString().padLeft(2, '0')}/'
                  '${selectedDate.value!.year}',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ),
    );
  }
}
