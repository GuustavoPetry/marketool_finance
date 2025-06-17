import 'package:flutter/material.dart';
import 'package:marketool_financer/src/controllers/login_controller.dart';
import 'package:marketool_financer/src/services/auth_service.dart';
import 'package:marketool_financer/src/widgets/custom_button.dart';
import 'package:marketool_financer/src/widgets/custom_input_field.dart';
import 'package:marketool_financer/src/widgets/custom_logo_design.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _controller = LoginController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _message = "";

  void _handleLogin() async {
    final sucess = await _controller.login(
      _usernameController.text,
      _passwordController.text,
    );

    if (!mounted) return;

    if (sucess) {
      AuthService.login(_usernameController.text);
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      setState(() {
        _message = "Credenciais Inválidas";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Login",
            style: TextStyle(
              fontFamily: "RobotoMono",
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF2E7D32),
      ),
      backgroundColor: Color(0xFFF8F9F7),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          LogoDesignWidget(),

          const SizedBox(height: 20),
          CustomInputField(
            isObscure: false,
            text: "Seu E-mail",
            inputController: _usernameController,
          ),

          const SizedBox(height: 16),
          CustomInputField(
            isObscure: true,
            text: "Sua senha",
            inputController: _passwordController,
          ),

          const SizedBox(height: 10),
          Center(
            child: Text(
              _message,
              style: TextStyle(
                fontFamily: "RobotoMono",
                fontSize: 16,
                color: Colors.red,
              ),
            ),
          ),

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(text: "Entrar", onPressed: _handleLogin),


                SizedBox(width: 10),

                CustomButton(
                  text: "Cadastrar",
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/register");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
