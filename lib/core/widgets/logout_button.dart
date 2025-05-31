import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketool_finance/app/auth/controllers/login_controller.dart';
import 'package:marketool_finance/core/routes/app_routes.dart';

class LogoutButton extends GetView<LoginController> {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.offAllNamed(AppRoutes.login);
      },
      icon: const Icon(
        Icons.logout,  // Botão de Logout
      ),  
    );
  }
}
