import 'package:flutter/material.dart';

class PieChartModel {
  final String ticker;
  final double percentage;
  final Color color;

  PieChartModel({
    required this.ticker,
    required this.percentage,
    required this.color,
  });
}
