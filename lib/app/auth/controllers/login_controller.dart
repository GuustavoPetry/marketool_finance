import 'package:marketool_finance/app/_core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailInput = TextEditingController();
  final passwordInput = TextEditingController();
  static const String email = "admin";
  static const password = "admin";
  var isWarning = false.obs;
  var erro = "".obs;

  @override
  void onClose() {
    emailInput.dispose();
    passwordInput.dispose();
    super.onClose();
  }

  // aqui é só uma simulação de login, mas aqui faz a parte de conexão com o banco de dados.
  bool validateFields() {
    if (emailInput.text.isEmpty) {
      erro.value = "O campo E-mail não pode ser vazio";
      return false;
    }
    if (passwordInput.text.isEmpty) {
      erro.value = "O campo Senha não pode ser vazio";
      return false;
    }
    if (emailInput.text != email || passwordInput.text != password) {
      erro.value = "Credencias inválidas";
      return false;
    }
    return true;
  }

  void tryTologin() {
    isWarning.value = !validateFields();
    if (!isWarning.value) {
      login();
    }
  }

  void login() {
    Get.offNamed(AppRoutes.home);
  }

}
