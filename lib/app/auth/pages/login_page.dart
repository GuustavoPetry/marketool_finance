import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketool_finance/app/auth/controllers/login_controller.dart';
import 'package:marketool_finance/app/auth/widgets/input_field.dart';
import 'package:marketool_finance/app/auth/widgets/auth_button.dart';
import 'package:marketool_finance/app/auth/widgets/login_warning.dart';
import 'package:marketool_finance/app/auth/widgets/logo_design.dart';
import 'package:marketool_finance/app/_core/routes/app_routes.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

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
              AuthButton(
                isAuthButton: true,
                text: "Entrar",
                // Adicione o onPressed para login se necessário
              ),
              AuthButton(
                isAuthButton: false,
                text: "Cadastrar",
                onPressed: () {
                  Get.toNamed(AppRoutes.register);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}