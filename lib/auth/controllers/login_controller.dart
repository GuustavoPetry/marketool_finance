import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketool_finance/home/pages/home_page.dart';

class LoginController extends GetxController {
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  static const String email = "admin";
  static const password = "admin";
  var isWarning = false.obs;
  var erro = "".obs;

  // aqui é só uma simulação de login, mas aqui faz a parte de conexão com o banco de dados.

  void tryTologin() {
    switch (emailInput.text) {
      case email:
        checkPassword();
        break;

      case "":
        isWarning.value = true;
        erro.value = "O campo E-mail não pode ser vazio";
        break;

      default:
        isWarning.value = true;
        erro.value = "Credenciais Inválidas";
        break;
    }
  }

  void checkPassword() {
    switch (passwordInput.text) {
      case password:
        login();
        break;

      case "":
        isWarning.value = true;
        erro.value = "O campo Senha não pode ser vazio";
        break;

      default:
        isWarning.value = true;
        erro.value = "Credenciais Inválidas";
        break;
    }
  }

  void login() {
    Get.to(HomeView());
  }

}
