import 'package:flutter/material.dart';
import 'package:marketool_financer/src/services/auth_service.dart';
import 'package:marketool_financer/src/services/custody_service.dart';
import 'package:marketool_financer/src/widgets/custom_home_table.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _service = CustodyService();
  late Future<List<Map<String, dynamic>>> _futureProfit;

  @override
  void initState() {
    super.initState();
    _futureProfit = _service.getUserProfit(AuthService.userId!);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: _futureProfit,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Erro: ${snapshot.error}",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "Nenhum dado encontrado",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          final data = snapshot.data!;

          final tableData = data
              .map(
                (item) => [
                  item["assetTicker"],
                  item["regularMarketChangePercent"],
                  item["regularMarketChange"],
                  item["profitPercentage"],
                  item["profitValue"],
                ],
              )
              .toList();

          return ListView(
            children: [
              CustomHomeTable(
                columnLabels: [
                  "Ativo",
                  "% Diária",
                  "R\$ Diária",
                  "% Total",
                  "R\$ Total",
                ],
                columnWidths: [80, 120, 120, 120, 120],
                data: tableData,
              ),
            ],
          );
        },
      ),
    );
  }
}
