import 'package:flutter/material.dart';
import 'package:marketool_financer/src/widgets/custom_home_table.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: ListView(
        children: [
          CustomHomeTable(
            columnLabels: ["Ativo", "Δ Diária", "Δ Total"],
            columnWidths: [120, 120, 120],
            data: [
              ["PETR4", 1.5, -0.8],
              ["VALE3", -0.3, 2.1],
            ],
          ),
        ],
      ),
    );
  }
}
