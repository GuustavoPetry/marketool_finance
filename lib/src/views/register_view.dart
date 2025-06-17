import 'package:flutter/material.dart';
import 'package:marketool_financer/src/controllers/register_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

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
        title: const Text('Cadastro'),
        backgroundColor: Colors.green[700],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green[700]!,
              Colors.green[500]!,
              Colors.green[300]!,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _controller.formKey,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                Text(
                  "Crie sua conta",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Preencha os campos abaixo para começar.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _controller.nameController,
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person, color: Colors.green),
                        ),
                        validator: _controller.validateName,
                      ),
                      const Divider(color: Colors.green),
                      TextFormField(
                        controller: _controller.emailController,
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email, color: Colors.green),
                        ),
                        validator: _controller.validateEmail,
                      ),
                      const Divider(color: Colors.green),
                      TextFormField(
                        controller: _controller.phoneController,
                        decoration: const InputDecoration(
                          labelText: 'Telefone',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.phone, color: Colors.green),
                        ),
                        validator: _controller.validatePhone,
                      ),
                      const Divider(color: Colors.green),
                      InkWell(
                        onTap: _pickBirthDate,
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Data de Nascimento',
                            border: InputBorder.none,
                            prefixIcon: const Icon(Icons.calendar_today, color: Colors.green),
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
                      const Divider(color: Colors.green),
                      TextFormField(
                        controller: _controller.passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock, color: Colors.green),
                        ),
                        obscureText: true,
                        validator: _controller.validatePassword,
                      ),
                      const Divider(color: Colors.green),
                      TextFormField(
                        controller: _controller.confirmPasswordController,
                        decoration: const InputDecoration(
                          labelText: 'Confirmar Senha',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock_outline, color: Colors.green),
                        ),
                        obscureText: true,
                        validator: _controller.validateConfirmPassword,
                      ),
                    ],
                  ),
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: _controller.isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Text(
                          'Registrar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}