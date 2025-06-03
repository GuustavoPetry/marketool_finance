import 'package:marketool_finance/app/auth/controllers/login_controller.dart';
import 'package:marketool_finance/app/_core/widgets/input_field.dart';
import 'package:marketool_finance/app/auth/widgets/auth_button.dart';
import 'package:marketool_finance/app/auth/widgets/login_warning.dart';
import 'package:marketool_finance/app/auth/widgets/logo_design.dart';
import 'package:marketool_finance/app/_core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        LogoDesign(),

        const SizedBox(height: 20),
        InputField(
          isObscure: false,
          text: "Seu E-mail",
          inputController: controller.emailInput,
        ),

        const SizedBox(height: 16),
        InputField(
          isObscure: true,
          text: "Sua senha",
          inputController: controller.passwordInput,
        ),

        const SizedBox(height: 30),
        LoginWarning(),

        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: "Entrar",
                onPressed: controller.tryTologin,
              ),

              CustomButton(
                text: "Cadastrar",
                onPressed: () {
                  Get.offAllNamed(AppRoutes.register);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}