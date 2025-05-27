import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:marketool_finance/auth/controllers/login_controller.dart';

class LoginWarning extends GetView<LoginController> {
  const LoginWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => controller.isWarning.value
                ? Text(
                    controller.erro.value,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  )
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
