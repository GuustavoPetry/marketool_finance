import 'package:flutter/material.dart';

class CustomHomeTable extends StatefulWidget {
  final List<String> columnLabels;
  final List<double> columnWidths;
  final List<List<dynamic>> data;
  final String fontFamily;

  const CustomHomeTable({
    super.key,
    required this.columnLabels,
    required this.data,
    this.columnWidths = const [],
    this.fontFamily = "RobotoMono",
  });

  @override
  State<CustomHomeTable> createState() => _CustomHomeTableState();
}

class _CustomHomeTableState extends State<CustomHomeTable> {
  String formatValue(dynamic value) {
    if (value is double) {
      return value.toStringAsFixed(2);
    }
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Table(
          columnWidths: {
            for (int i = 0; i < widget.columnLabels.length; i++)
              i: FixedColumnWidth(
                widget.columnWidths.isNotEmpty ? widget.columnWidths[i] : 100,
              ),
          },
          border: TableBorder(
            horizontalInside: BorderSide(color: Colors.grey.shade400, width: 1),
          ),
          children: [
            TableRow(
              decoration: BoxDecoration(color: const Color(0xFF2E7D32)),
              children: widget.columnLabels.map((label) {
                return SizedBox(
                  height: 40,
                  child: Center(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: widget.fontFamily,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            ...widget.data.map((row) {
              return TableRow(
                children: row.map((cell) {
                  return SizedBox(
                    height: 35,
                    child: Center(
                      child: Text(
                        cell is num ? formatValue(cell) : cell.toString(),
                        style: TextStyle(
                          color: (cell is num)
                              ? (cell >= 0 ? Colors.green : Colors.red)
                              : Colors.white,
                          fontSize: 14,
                          fontFamily: widget.fontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }),
          ],
        ),
      ),
    );
  }
}
