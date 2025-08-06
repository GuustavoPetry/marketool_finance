import 'package:marketool_financer/src/models/data_price_model.dart';
import 'package:marketool_financer/src/services/api_service.dart';

class DataPriceController {
  final apiService = ApiService();

  Future<List<DataPriceModel>> historicalDataPrice(String ticker) async {
    final results = await apiService.historicalDataPrice(ticker);

    return results;
  }
}