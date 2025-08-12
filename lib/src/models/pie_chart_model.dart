import 'package:flutter/material.dart';

class PieChartModel {
  final String ticker;
  final double percentage;
  final Color color;

  PieChartModel({
    required this.ticker,
    required this.percentage,
    this.color = Colors.white
  });

  factory PieChartModel.fromJson(Map<String, dynamic> json) {
    return PieChartModel(
      ticker: json["assetTicker"], 
      percentage: (json["percentage"] as num).toDouble(),
    );
  }
}
