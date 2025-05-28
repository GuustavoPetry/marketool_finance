import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketool_finance/auth/controllers/login_controller.dart';
import 'package:marketool_finance/auth/widgets/input_field.dart';
import 'package:marketool_finance/auth/widgets/auth_button.dart';
import 'package:marketool_finance/auth/widgets/login_warning.dart';
import 'package:marketool_finance/auth/widgets/logo_image.dart';
import 'package:marketool_finance/auth/widgets/logo_subtitle.dart';
import 'package:marketool_finance/auth/widgets/logo_title.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        const SizedBox(height: 40),
        Center(
          child: LogoImage()
        ),

        const SizedBox(height: 24),
        Center(
          child: LogoTitle()
        ),

        const SizedBox(height: 8),
        Center(
          child: LogoSubtitle()
        ),

        const SizedBox(height: 20),
        InputField("Seu E-mail", false),

        const SizedBox(height: 16),
        InputField("Sua Senha", true),

        const SizedBox(height: 30),
        LoginWarning(),

        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthButton("Entrar", true), 
              AuthButton("Cadastrar", false)
            ],
          ),
        ),
      ],
    );
  }
}
