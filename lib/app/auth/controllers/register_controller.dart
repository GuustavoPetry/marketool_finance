import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  final birthDate = Rxn<DateTime>();
  final birthDateError = RxnString();
  final isLoading = false.obs;

  final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  Future<bool> register() async {
    try {
      final isValid = validateBirthDate() == null;

      if (formKey.currentState!.validate() && isValid) {
        isLoading.value = true;

        await Future.delayed(const Duration(seconds: 2));

        isLoading.value = false;
        return true;
      }

      return false;
    } catch (e) {
      isLoading.value = false;
      debugPrint('Erro no register: $e');
      return false;
    }
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
    if (birthDate.value == null) {
      birthDateError.value = 'Data de nascimento obrigatória';
      return birthDateError.value;
    }
    birthDateError.value = null;
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
}
