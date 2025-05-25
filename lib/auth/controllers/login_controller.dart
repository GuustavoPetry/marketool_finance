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
        erro.value = "email is empty";
        break;

      default:
        isWarning.value = true;
        erro.value = "email not found";
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
        erro.value = "password is empty";
        break;

      default:
        isWarning.value = true;
        erro.value = "incorrect password";
        break;
    }
  }

  void login() {
    Get.to(HomeView());
  }

  String isError(String erro) {
    switch (erro) {
      case "email is empty":
        return "Informe um E-mail";

      case "email not found":
        return "Dados incorretos";

      case "password is empty":
        return "Informe uma senha";

      case "incorrect password":
        return "Dados incorretos";

      default:
        return "";
    }
  }
}
