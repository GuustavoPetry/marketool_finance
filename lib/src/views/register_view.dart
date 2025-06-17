import 'package:flutter/material.dart';
import 'package:marketool_financer/src/controllers/register_controller.dart';

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
      appBar: AppBar(title: const Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _controller.formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _controller.nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: _controller.validateName,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _controller.emailController,
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: _controller.validateEmail,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _controller.phoneController,
                decoration: const InputDecoration(labelText: 'Telefone'),
                validator: _controller.validatePhone,
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
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _controller.passwordController,
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: _controller.validatePassword,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _controller.confirmPasswordController,
                decoration: const InputDecoration(labelText: 'Confirmar Senha'),
                obscureText: true,
                validator: _controller.validateConfirmPassword,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _controller.isLoading
                    ? null
                    : () async {
                        final success = await _controller.register(
                          onStateChange: () => setState(() {}),
                        );
                        if (success && context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Cadastro realizado com sucesso!'),
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
      ),
    );
  }
}
