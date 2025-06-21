import 'package:flutter/material.dart';
import 'package:marketool_financer/src/models/home_table_model.dart';

class CustomHomeTable extends StatefulWidget {
  final List<HomeTableModel> assets;

  const CustomHomeTable({super.key, required this.assets});

  @override
  State<CustomHomeTable> createState() => _CustomHomeTableState();
}

class _CustomHomeTableState extends State<CustomHomeTable> {
  bool showInPercentage = false;

  String formatValue(double value, {required bool inPercentage}) {
    if (inPercentage) {
      return "${value.toStringAsFixed(2)} %";
    } else {
      final prefix = value < 0 ? "-R\$ " : "R\$ ";
      return "$prefix${value.abs().toStringAsFixed(2)}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: Icon(
          Icons.pie_chart,
          size: 40,
          color: const Color(0xFF2E7D32),
        ),
        tilePadding: EdgeInsets.symmetric(horizontal: 15),
        childrenPadding: EdgeInsets.zero,
        initiallyExpanded: true,
        backgroundColor: Colors.grey,
        collapsedBackgroundColor: Colors.grey,
        title: const Text(
          "Meus Ativos",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "RobotoMono",
            color: Colors.white,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                showInPercentage ? "Mostrar em R\$" : "Mostrar em %",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "RobotoMono",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              value: showInPercentage,
              onChanged: (value) {
                setState(() {
                  showInPercentage = value;
                });
              },
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Table(
              columnWidths: const {
                0: FixedColumnWidth(100),
                1: FixedColumnWidth(100),
                2: FixedColumnWidth(100),
              },
              border: TableBorder(
                horizontalInside: BorderSide(
                  color: Colors.grey.shade400,
                  width: 1,
                ),
              ),
              children: [
                TableRow(
                  decoration: BoxDecoration(color: const Color(0xFF2E7D32)),
                  children: [
                    TableCell(
                      child: SizedBox(
                        height: 40,
                        child: Center(
                          child: Text(
                            "Ativo",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "RobotoMono",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: SizedBox(
                        height: 40,
                        child: Center(
                          child: Text(
                            "Δ Diária",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "RobotoMono",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: SizedBox(
                        height: 40,
                        child: Center(
                          child: Text(
                            "Δ Total",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "RobotoMono",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                ...widget.assets.map((asset) {
                  return TableRow(
                    children: [
                      SizedBox(
                        height: 35,
                        child: Center(
                          child: Text(
                            asset.ticker,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "RobotoMono",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        child: Center(
                          child: Text(
                            formatValue(
                              asset.dailyVariation,
                              inPercentage: showInPercentage,
                            ),
                            style: TextStyle(
                              color: asset.dailyVariation >= 0
                                  ? const Color(0xFF2E7D32)
                                  : Colors.red,
                              fontSize: 16,
                              fontFamily: "RobotoMono",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        child: Center(
                          child: Text(
                            formatValue(
                              asset.totalVariation,
                              inPercentage: showInPercentage,
                            ),
                            style: TextStyle(
                              color: asset.totalVariation >= 0
                                  ? const Color(0xFF2E7D32)
                                  : Colors.red,
                              fontSize: 16,
                              fontFamily: "RobotoMono",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
