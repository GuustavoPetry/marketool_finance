import 'package:flutter/material.dart';
import 'package:marketool_financer/src/models/home_table_model.dart';
import 'package:marketool_financer/src/widgets/custom_app_bar.dart';
import 'package:marketool_financer/src/widgets/custom_app_drawer.dart';
import 'package:marketool_financer/src/widgets/custom_home_table.dart';
import 'package:marketool_financer/src/widgets/custom_navigator_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomAppDrawer(),
      bottomNavigationBar: CustomNavigatorBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
    );
  }
}
