import 'package:flutter/material.dart';
import 'package:marketool_financer/src/controllers/forgot_controller.dart';
import 'package:marketool_financer/src/widgets/custom_app_bar.dart';
import 'package:marketool_financer/src/widgets/custom_button.dart';
import 'package:marketool_financer/src/widgets/custom_form_field.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final ForgotPasswordController _controller = ForgotPasswordController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _controller.sendRecoveryEmail(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: const Color(0xFF002B23),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Digite seu e-mail para receber instruções:',
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              CustomFormField(
                isObscure: false,
                icon: const Icon(Icons.email, color: Colors.white),
                text: 'Seu e-mail',
                type: TextInputType.emailAddress,
                inputController: _controller.emailController,
                inputValidator: _controller.validateEmail,
              ),
              const SizedBox(height: 30),
              CustomButton(
                label: 'Enviar e-mail de recuperação',
                icon: const Icon(Icons.send),
                onPressed: _submit,
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/login");
                },
                child: const Text(
                  "Voltar",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
