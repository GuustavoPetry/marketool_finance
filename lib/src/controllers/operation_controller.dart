import 'package:marketool_financer/src/models/operation_model.dart';
import 'package:marketool_financer/src/services/custody_service.dart';

class OperationController {
  final custodyService = CustodyService();

  Future<bool> registerOperation(OperationModel operation) async {
    final register = await custodyService.addOperation(operation.toJson());

    if(register) return true;
    return false;
  }
}