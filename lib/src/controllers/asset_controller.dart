import 'package:flutter/material.dart';
import '../models/asset_model.dart';

class AssetController extends ChangeNotifier {
  final List<AssetModel> _assets = [];

  List<AssetModel> get assets => _assets;

  Future<void> fetchAssets() async {
    await Future.delayed(const Duration(seconds: 1));

    _assets.clear();
    _assets.addAll([
      AssetModel(
        name: "Petrobras",
        ticker: "PETR4",
        type: "Ação",
        quantity: 100,
        averagePrice: 28.50,
      ),
      AssetModel(
        name: "Vale",
        ticker: "VALE3",
        type: "Ação",
        quantity: 50,
        averagePrice: 68.75,
      ),
    ]);

    notifyListeners();
  }
}
