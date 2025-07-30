import 'package:marketool_financer/src/models/user_model.dart';
import 'package:marketool_financer/src/services/api_service.dart';

class LoginController {

  final apiService = ApiService();

  Future<Map<String, dynamic>?> login(UserModel user) async {
    final auth = await apiService.login(user.toJson());

    if(auth != null) {
      return auth;
    }
    return null;
  }

}
