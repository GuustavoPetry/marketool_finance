import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketool_finance/auth/controllers/login_controller.dart';
import 'package:marketool_finance/auth/widgets/email_field.dart';
import 'package:marketool_finance/auth/widgets/login_button.dart';
import 'package:marketool_finance/auth/widgets/login_warning.dart';
import 'package:marketool_finance/auth/widgets/password_field.dart';
import 'package:marketool_finance/auth/widgets/register_button.dart';

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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              "https://images.unsplash.com/photo-1662144374178-753a74fa28fb?q=80&fit=crop&w=1200&h=1200",
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Center(
          child: Text(
            "MarkeTool",
            /* aqui ta a parte de design do app */
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
              letterSpacing: 2,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            "Gestão de Investimentos",
            style: TextStyle(
              fontSize: 18,
              color: Colors.blueGrey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 40),
        EmailField(),
        const SizedBox(height: 16),
        PasswordField(),
        const SizedBox(height: 30),
        LoginWarning(),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [LoginButton(), RegisterButton()],
          ),
        ),
      ],
    );
  }
}
