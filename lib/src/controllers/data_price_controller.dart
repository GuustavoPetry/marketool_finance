import 'package:marketool_financer/src/models/data_price_model.dart';
import 'package:marketool_financer/src/services/brappi_service.dart';

class DataPriceController {
  final brappiService = BrappiService();

  Future<List<DataPriceModel>> historicalDataPrice(String ticker) async {
    final results = await brappiService.historicalDataPrice(ticker);

    return results;
  }
}
