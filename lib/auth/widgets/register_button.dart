// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketool_finance/auth/controllers/login_controller.dart';

class RegisterButton extends GetView<LoginController> {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
          child: Text("Cadastrar", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
