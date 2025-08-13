import 'package:flutter/material.dart';
import 'package:marketool_financer/src/models/pie_chart_model.dart';
import 'package:marketool_financer/src/services/auth_service.dart';
import 'package:marketool_financer/src/services/custody_service.dart';
import 'package:marketool_financer/src/widgets/custom_button.dart';
import 'package:marketool_financer/src/widgets/custom_home_table.dart';
import 'package:marketool_financer/src/widgets/custom_pie_chart.dart';

class PatrimonyView extends StatefulWidget {
  const PatrimonyView({super.key});

  @override
  State<PatrimonyView> createState() => _PatrimonyViewState();
}

class _PatrimonyViewState extends State<PatrimonyView> {
  late Future<List<PieChartModel>> custodyData;
  final custodyService = CustodyService();

  @override
  void initState() {
    super.initState();
    custodyData = custodyService.getPieChartData(AuthService.userId!);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: FutureBuilder<List<PieChartModel>>(
        future: custodyData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erro: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Você ainda não possui ativos",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Registre suas operações primeiro",
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    label: "Cadastrar Operações",
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, "/operation"),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: CustomPieChart(data: snapshot.data!),
                  ),
                  SizedBox(height: 20),
                  CustomHomeTable(
                    columnLabels: ["ATIVO", "QTD.", "VALOR", "%"],
                    columnWidths: [90, 90, 120, 80],
                    data: snapshot.data!.map((asset) {
                      return [
                        asset.ticker,
                        asset.quantity.toString(),
                        asset.totalInvested.toStringAsFixed(2),
                        asset.percentage.toStringAsFixed(2),
                      ];
                    }).toList(),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
