import 'package:flutter/material.dart';

class RegisterController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  DateTime? birthDate;
  String? birthDateError;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  Future<bool> register({
    required VoidCallback onStateChange,
  }) async {
    try {
      birthDateError = validateBirthDate();
      final isFormValid = formKey.currentState?.validate() ?? false;
      final isBirthDateValid = birthDateError == null;

      if (isFormValid && isBirthDateValid) {
        isLoading = true;
        onStateChange(); 

        await Future.delayed(const Duration(seconds: 2));

        clearForm();
        isLoading = false;
        onStateChange(); 
        return true;
      }

      onStateChange();
      return false;
    } catch (e) {
      debugPrint('Erro no register: $e');
      isLoading = false;
      onStateChange();
      return false;
    }
  }

  void clearForm() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    phoneController.clear();
    birthDate = null;
    birthDateError = null;
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Informe seu nome';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || !value.contains('@')) {
      return 'E-mail inválido';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.length < 8) {
      return 'Telefone inválido';
    }
    return null;
  }

  String? validateBirthDate() {
    if (birthDate == null) {
      return 'Data de nascimento obrigatória';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Senha muito curta';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return 'Senhas não conferem';
    }
    return null;
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
  }
}