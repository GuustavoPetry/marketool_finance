import 'package:marketool_financer/src/services/Verify_cpf.dart';

class LoginController {
  final VerifyCPF cpf = VerifyCPF();

  Future<bool> loginWithCPF(String username, String cpfDocument) async {
    await Future.delayed(Duration(seconds: 2));

    // Login fixo para admin
    if (username == 'admin' && cpfDocument == 'admin') {
      return true;
    }

    // Verifica se o CPF é válido (login comum)
    return cpf.isValid(cpfDocument);
  }
}
