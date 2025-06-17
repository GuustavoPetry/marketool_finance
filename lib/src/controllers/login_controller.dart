import 'package:marketool_financer/src/models/user_model.dart';

class LoginController {
  final UserModel _mockUser = UserModel(
    username: "Gustavo",
    password: "admin",
  );

  Future<bool> login(String username, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return username == _mockUser.username && password == _mockUser.password;
  }
}
