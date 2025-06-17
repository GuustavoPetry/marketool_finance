// lib/views/asset_table_view.dart
import 'package:flutter/material.dart';
import '../controllers/asset_controller.dart';

class AssetTableView extends StatelessWidget {
  const AssetTableView({super.key});

  @override
  Widget build(BuildContext context) {
    final AssetController controller = AssetController();

    return FutureBuilder(
      future: controller.fetchAssets(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.assets.isEmpty) {
          return const Center(child: Text('Nenhum ativo encontrado.'));
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Nome')),
              DataColumn(label: Text('Ticker')),
              DataColumn(label: Text('Tipo')),
              DataColumn(label: Text('Quantidade')),
              DataColumn(label: Text('Preço Médio')),
            ],
            rows: controller.assets.map((asset) {
              return DataRow(
                cells: [
                  DataCell(Text(asset.name)),
                  DataCell(Text(asset.ticker)),
                  DataCell(Text(asset.type)),
                  DataCell(Text(asset.quantity.toString())),
                  DataCell(Text(asset.averagePrice.toStringAsFixed(2))),
                ],
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
