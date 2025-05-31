import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketool_finance/auth/controllers/login_controller.dart';

class LogoutButton extends GetView<LoginController> {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        controller.emailInput.clear();  // Limpa input de E-mail
        controller.passwordInput.clear();  // Limpa input de senha
        controller.erro.value = "";  // Limpa erro, se houver
        Get.back();
      },
      icon: const Icon(
        Icons.logout,  // Botão de Logout
      ),  
    );
  }
}
