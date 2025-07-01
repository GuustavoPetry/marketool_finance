import 'package:marketool_financer/src/services/Verify_cpf.dart';

class LoginController {
  final VerifyCPF cpf = VerifyCPF();

  Future<bool> loginWithCPF(String username, String cpfDocument) async {
    await Future.delayed(Duration(seconds: 2));
    return cpf.isValid(cpfDocument);
  }

}
