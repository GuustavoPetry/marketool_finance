import 'package:flutter/material.dart';
import 'package:marketool_financer/src/models/asset_model.dart';
import 'package:marketool_financer/src/widgets/custom_asset_card.dart';
import 'package:marketool_financer/src/widgets/custom_asset_chart.dart';
import 'package:marketool_financer/src/widgets/custom_asset_detail.dart';

class AssetDetailView extends StatelessWidget {
  const AssetDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final AssetModel asset =
        ModalRoute.of(context)!.settings.arguments as AssetModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          asset.ticker,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF2E7D32),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF001F1A), Color(0xFF0E1E1B)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAssetCard(assetData: asset),

                        SizedBox(height: 10),

                        CustomAssetDetail(),

                        const SizedBox(height: 20),

                        CustomAssetChart(),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
