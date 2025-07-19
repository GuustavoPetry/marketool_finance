import 'package:flutter/material.dart';
import 'package:marketool_financer/src/models/home_table_model.dart';
import 'package:marketool_financer/src/widgets/custom_home_table.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002B23),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: ListView(
            children: [
              CustomHomeTable(
                assets: [
                  HomeTableModel(
                    ticker: "BBAS3",
                    dailyVariation: 1.8,
                    totalVariation: 9.2,
                  ),
                  HomeTableModel(
                    ticker: "PETR4",
                    dailyVariation: -3.69,
                    totalVariation: -6.05,
                  ),
                  HomeTableModel(
                    ticker: "BBDC4",
                    dailyVariation: 2.37,
                    totalVariation: 46.18,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
