import 'package:marketool_financer/src/models/asset_model.dart';
import 'package:marketool_financer/src/services/api_service.dart';

class SearchAssetsController {
  final apiService = ApiService();

  Future<List<AssetModel>> getAssets(String search) async {
    final results = await apiService.searchAssets(search);

    return results;
  }
}