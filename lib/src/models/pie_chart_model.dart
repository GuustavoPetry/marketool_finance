import 'package:flutter/material.dart';

class PieChartModel {
  final String ticker;
  final int quantity;
  final double totalInvested;
  final double percentage;
  final Color color;

  PieChartModel({
    required this.ticker,
    required this.quantity,
    required this.totalInvested,
    required this.percentage,
    this.color = Colors.white,
  });

  factory PieChartModel.fromJson(Map<String, dynamic> json) {
    return PieChartModel(
      ticker: json["assetTicker"],
      quantity: (json["quantity"] as num).toInt(),
      totalInvested: (json["totalInvested"] as num).toDouble(),
      percentage: (json["percentage"] as num).toDouble(),
    );
  }
}
