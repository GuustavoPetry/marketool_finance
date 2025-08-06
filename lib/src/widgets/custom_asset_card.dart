import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketool_financer/src/models/asset_model.dart';

class CustomAssetCard extends StatelessWidget {
  final AssetModel assetData;
  const CustomAssetCard({required this.assetData, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 10),
        assetData.logo.endsWith('.svg')
            ? SvgPicture.network(
                assetData.logo,
                width: 100,
                height: 100,
                placeholderBuilder: (context) =>
                    const CircularProgressIndicator(),
              )
            : Image.network(
                assetData.logo,
                width: 100,
                height: 100,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.broken_image,
                  size: 100,
                  color: Colors.white70,
                ),
              ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                assetData.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                assetData.sector,
                style: const TextStyle(fontSize: 16, color: Colors.white70),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    "R\$ ${assetData.close.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "${assetData.change.toStringAsFixed(2)}%",
                    style: TextStyle(
                      fontSize: 16,
                      color: assetData.change >= 0 ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
