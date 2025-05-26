// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketool_finance/auth/controllers/login_controller.dart';

class LoginButton extends GetView<LoginController> {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => controller.isWarning.value
              ? Text(
                  controller.erro.value,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                )
              : SizedBox.shrink(),
        ),

        ElevatedButton(
          onPressed: () {
            controller.tryTologin();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
          child: Text("Entrar", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
