import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketool_finance/app/_core/routes/app_routes.dart';
import 'package:marketool_finance/app/auth/widgets/date_picker.dart';
import 'package:marketool_finance/app/auth/widgets/input_form_field.dart';
import '../controllers/register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed(AppRoutes.login);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),

      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            const SizedBox(height: 24),
            InputFormField(
              text: "Nome Completo",
              icon: Icon(Icons.person),
              type: TextInputType.name,
              isObscure: false,
              inputController: controller.nameController,
              inputValidator: controller.validateName,
            ),

            const SizedBox(height: 16),
            InputFormField(
              text: "E-mail",
              icon: Icon(Icons.email),
              type: TextInputType.emailAddress,
              isObscure: false,
              inputController: controller.emailController,
              inputValidator: controller.validateEmail,
            ),

            const SizedBox(height: 16),
            InputFormField(
              text: "Telefone",
              icon: Icon(Icons.phone),
              type: TextInputType.phone,
              isObscure: false,
              inputController: controller.phoneController,
              inputValidator: controller.validatePhone,
            ),

            const SizedBox(height: 16),
            DatePicker(
              selectedDate: controller.birthDate,
              errorText: controller.birthDateError,
              label: 'Data de nascimento',
              icon: const Icon(Icons.cake),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              initialDate: DateTime(2000, 1, 1),
              onChanged: controller.validateBirthDate,
            ),

            const SizedBox(height: 16),
            InputFormField(
              text: "Senha",
              icon: Icon(Icons.lock),
              type: TextInputType.text,
              isObscure: true,
              inputController: controller.passwordController,
              inputValidator: controller.validatePassword,
            ),

            const SizedBox(height: 16),
            InputFormField(
              text: "Confirme a Senha",
              icon: Icon(Icons.lock_outline),
              type: TextInputType.text,
              isObscure: true,
              inputController: controller.confirmPasswordController,
              inputValidator: controller.validateConfirmPassword,
            ),

            const SizedBox(height: 24),
            SizedBox(
              width: 150,
              child: Obx(
                () => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () async {
                          final success = await controller.register();
                          if (success) {
                            Get.snackbar(
                              'Sucesso',
                              'Cadastro realizado com sucesso!',
                              snackPosition: SnackPosition.BOTTOM,
                              duration: Duration(seconds: 5),
                            );
                            await Future.delayed(const Duration(seconds: 5));
                            Get.offAllNamed(AppRoutes.login);
                          }
                        },
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text('Cadastrar'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
