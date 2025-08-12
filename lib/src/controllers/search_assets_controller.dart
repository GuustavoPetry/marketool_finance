import 'package:marketool_financer/src/models/asset_model.dart';
import 'package:marketool_financer/src/services/brappi_service.dart';

class SearchAssetsController {
  final brappiService = BrappiService();

  Future<List<AssetModel>> getAssets(String search) async {
    final results = await brappiService.searchAssets(search);

    return results;
  }
}