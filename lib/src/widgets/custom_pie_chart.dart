import 'package:flutter/material.dart';
import 'package:marketool_financer/src/models/pie_chart_model.dart';
import 'package:fl_chart/fl_chart.dart';

class CustomPieChart extends StatelessWidget {
  final List<PieChartModel> data;
  final double radius;
  final double centerTextSize;

  const CustomPieChart({
    super.key,
    required this.data,
    this.radius = 100,
    this.centerTextSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: PieChart(
          PieChartData(
            sectionsSpace: 1,
            centerSpaceRadius: 40,
            sections: _buildSections(),
            borderData: FlBorderData(show: false),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildSections() {
    return data.map((asset) {
      return PieChartSectionData(
        color: asset.color,
        value: asset.percentage,
        radius: radius,
        title: asset.ticker,
        titleStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }
}
