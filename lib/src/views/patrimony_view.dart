import 'package:flutter/material.dart';
import 'package:marketool_financer/src/models/pie_chart_model.dart';
import 'package:marketool_financer/src/widgets/custom_pie_chart.dart';

class PatrimonyView extends StatefulWidget {
  const PatrimonyView({super.key});

  @override
  State<PatrimonyView> createState() => _PatrimonyViewState();
}

class _PatrimonyViewState extends State<PatrimonyView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: CustomPieChart(
        data: [
          PieChartModel(
            ticker: "BBAS3",
            percentage: 33.33,
            color: Colors.green,
          ),
          PieChartModel(
            ticker: "PETR4",
            percentage: 33.33,
            color: Colors.amber,
          ),
          PieChartModel(
            ticker: "BBDC4",
            percentage: 33.33,
            color: Colors.deepPurpleAccent,
          ),
        ],
      ),
    );
  }
}
