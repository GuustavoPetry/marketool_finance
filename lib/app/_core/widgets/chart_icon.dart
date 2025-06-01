import 'package:flutter/material.dart';

class ChartIcon extends StatelessWidget {
  const ChartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.show_chart),
      tooltip: 'Gráficos',
      iconSize: 40,
      onPressed: () {},
    );
  }
}
