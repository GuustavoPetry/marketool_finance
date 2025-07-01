import 'package:flutter/material.dart';

class ForgotPasswordController {
  final TextEditingController emailController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite um e-mail';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Digite um e-mail válido';
    }

    return null;
  }

  Future<void> sendRecoveryEmail(BuildContext context) async {
    
    await Future.delayed(const Duration(seconds: 1));

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Se o e-mail estiver correto, enviaremos as instruções.',
            style: TextStyle(fontSize: 16),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void dispose() {
    emailController.dispose();
  }
}
