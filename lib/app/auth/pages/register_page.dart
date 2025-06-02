import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketool_finance/app/_core/routes/app_routes.dart';
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
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000, 1, 1),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        controller.birthDate.value = picked;
                        controller.validateBirthDate();
                      }
                    },
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Data de nascimento',
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.cake),
                        labelStyle: Theme.of(context).textTheme.labelSmall,
                        errorText: controller.birthDateError.value,
                      ),
                      child: Text(
                        controller.birthDate.value == null
                            ? 'Selecione sua data de nascimento'
                            : '${controller.birthDate.value!.day.toString().padLeft(2, '0')}/'
                                  '${controller.birthDate.value!.month.toString().padLeft(2, '0')}/'
                                  '${controller.birthDate.value!.year}',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  ),
                ],
              ),
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
                            );
                            controller.nameController.clear();
                            controller.emailController.clear();
                            controller.phoneController.clear();
                            controller.passwordController.clear();
                            controller.confirmPasswordController.clear();
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
