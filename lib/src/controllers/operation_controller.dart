import 'package:marketool_financer/src/models/operation_model.dart';
import 'package:marketool_financer/src/services/api_service.dart';

class OperationController {
  final apiService = ApiService();

  Future<bool> registerOperation(OperationModel operation) async {
    final register = await apiService.addOperation(operation.toJson());

    if(register) return true;
    return false;
  }
}