import 'package:flutter/material.dart';
import 'package:marketool_financer/src/controllers/register_controller.dart';
import 'package:marketool_financer/src/widgets/custom_button.dart';
import 'package:marketool_financer/src/widgets/custom_date_picker.dart';
import 'package:marketool_financer/src/widgets/custom_form_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final RegisterController _controller;

  @override
  void initState() {
    super.initState();
    _controller = RegisterController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickBirthDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _controller.birthDate = picked;
        _controller.birthDateError = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Cadastro',
            style: TextStyle(color: Color(0xFFF8F9F7)),
          ),

        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/login");
          },
          icon: Icon(Icons.arrow_back, color: Color(0xFFF8F9F7)),
        ),
        backgroundColor: const Color(0xFF2E7D32),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _controller.formKey,
          child: ListView(
            children: [
              CustomFormField(
                text: "Nome Completo",
                icon: Icon(Icons.person),
                type: TextInputType.text,
                isObscure: false,
                inputController: _controller.nameController,
                inputValidator: _controller.validateName,
              ),

              const SizedBox(height: 12),

              CustomFormField(
                text: "E-mail",
                icon: Icon(Icons.email),
                type: TextInputType.emailAddress,
                isObscure: false,
                inputController: _controller.emailController,
                inputValidator: _controller.validateEmail,
              ),

              const SizedBox(height: 12),

              CustomFormField(
                text: "Nº Celular",
                icon: Icon(Icons.phone),
                type: TextInputType.phone,
                isObscure: false,
                inputController: _controller.phoneController,
                inputValidator: _controller.validatePhone,
              ),

              const SizedBox(height: 12),

              InkWell(
                onTap: _pickBirthDate,
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Data de Nascimento',
                    border: const OutlineInputBorder(),
                    errorText: _controller.birthDateError,
                  ),
                  child: Text(
                    _controller.birthDate != null
                        ? '${_controller.birthDate!.day.toString().padLeft(2, '0')}/'
                              '${_controller.birthDate!.month.toString().padLeft(2, '0')}/'
                              '${_controller.birthDate!.year}'
                        : 'Selecione sua data de nascimento',
                  ),
                ),
              ),

              const SizedBox(height: 12),

              CustomFormField(
                text: "Senha",
                icon: Icon(Icons.password),
                type: TextInputType.text,
                isObscure: true,
                inputController: _controller.passwordController,
                inputValidator: _controller.validatePassword,
              ),

              const SizedBox(height: 12),

              CustomFormField(
                text: "Confirme a Senha",
                icon: Icon(Icons.password),
                type: TextInputType.text,
                isObscure: true,
                inputController: _controller.passwordController,
                inputValidator: _controller.validateConfirmPassword,
              ),

              const SizedBox(height: 24),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: "Voltar",
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/login");
                      },
                    ),

                    SizedBox(width: 20),

                    CustomButton(
                      text: "Registrar",
                      onPressed: _controller.isLoading
                          ? null
                          : () async {
                              final success = await _controller.register(
                                onStateChange: () => setState(() {}),
                              );
                              if (success && context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Cadastro realizado com sucesso!',
                                    ),
                                  ),
                                );
                              }
                            },
                      child: _controller.isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Registrar'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
