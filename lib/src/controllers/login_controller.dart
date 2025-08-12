import 'package:marketool_financer/src/models/user_model.dart';
import 'package:marketool_financer/src/services/auth_service.dart';

class LoginController {

  final authService = AuthService();

  Future<Map<String, dynamic>?> login(UserModel user) async {
    final auth = await authService.auth(user.toJson());

    if(auth != null) {
      return auth;
    }
    return null;
  }

}
