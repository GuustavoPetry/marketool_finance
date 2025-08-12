import 'package:flutter/material.dart';
import 'package:marketool_financer/src/models/register_model.dart';
import 'package:marketool_financer/src/services/user_service.dart';

class RegisterController {

  final passwordController = TextEditingController();
  final userService = UserService();

  Future<bool> register(RegisterModel register) async {
    final registration = await userService.register(register.toJson());

    if(registration) {
      return true;
    }
    return false;
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

}
