import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Adicione esta importação

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

class CustomPieChart extends StatefulWidget {
  final List<PieChartModel> data;

  const CustomPieChart({super.key, required this.data});

  @override
  State<CustomPieChart> createState() => _CustomPieChartState();
}

class _CustomPieChartState extends State<CustomPieChart> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        pieTouchData: PieTouchData(
          touchCallback: (FlTouchEvent event, pieTouchResponse) {
            setState(() {
              if (!event.isInterestedForInteractions ||
                  pieTouchResponse == null ||
                  pieTouchResponse.touchedSection == null) {
                touchedIndex = -1;
                return;
              }
              touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
            });
          },
        ),
        borderData: FlBorderData(show: false),
        sectionsSpace: 0,
        centerSpaceRadius: 40,
        sections: showingSections(),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(widget.data.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 16.0 : 12.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 40.0 : 30.0;

      // Porcentagens fictícias para demonstração
      final fakePercentage = (widget.data[i].percentage * 1.2).clamp(0, 100).toStringAsFixed(1);

      return PieChartSectionData(
        color: widget.data[i].color,
        value: widget.data[i].percentage,
        title: isTouched ? '$fakePercentage%' : widget.data[i].ticker,
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        badgeWidget: isTouched
            ? Container(
                width: widgetSize,
                height: widgetSize,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    widget.data[i].ticker,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              )
            : null,
        badgePositionPercentageOffset: 0.5,
      );
    });
  }
}

class PatrimonyView extends StatefulWidget {
  const PatrimonyView({super.key});

  @override
  State<PatrimonyView> createState() => _PatrimonyViewState();
}

class _PatrimonyViewState extends State<PatrimonyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002B23),
      body: Center(
        child: Container(
          width: 350,
          height: 350,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF002B23),
          ),
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
        ),
      ),
    );
  }
}