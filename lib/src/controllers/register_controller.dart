import 'package:flutter/material.dart';

class RegisterController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  final formKeyStep1 = GlobalKey<FormState>();
  final formKeyStep2 = GlobalKey<FormState>();
  final formKeyStep3 = GlobalKey<FormState>();

  DateTime? birthDate;
  String? birthDateError;

  bool isLoading = false;

  Future<bool> register({required List<GlobalKey<FormState>> formKeys}) async {
    try {
      final isFormValid = formKeys.every(
        (key) => key.currentState?.validate() ?? false,
      );

      if (!isFormValid) return false;

      if (birthDate == null) {
        birthDateError = "Selecione a data de nascimento";
        return false;
      }

      isLoading = true;

      await Future.delayed(const Duration(seconds: 2));

      clearForm();
      isLoading = false;
      return true;
    } catch (e) {
      debugPrint('Erro no register: $e');
      isLoading = false;
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

  String getFormattedBirthDate() {
    if (birthDate == null) return '';
    return '${birthDate!.day.toString().padLeft(2, '0')}/'
           '${birthDate!.month.toString().padLeft(2, '0')}/'
           '${birthDate!.year}';
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
