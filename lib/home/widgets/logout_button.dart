import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.logout,
            ), // aqui é o botão de quando o usuário clica volta pro login
          );
  }
}