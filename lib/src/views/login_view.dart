import 'package:flutter/material.dart';
import 'package:marketool_financer/src/controllers/login_controller.dart';
import 'package:marketool_financer/src/services/auth_service.dart';
import 'package:marketool_financer/src/widgets/custom_text_field.dart';
import 'package:marketool_financer/src/widgets/custom_logo_design.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with WidgetsBindingObserver {
  final ScrollController _scrollController = ScrollController();
  bool _keyboardVisible = false;
  final _controller = LoginController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;

  void _handleLogin() async {
    setState(() {
      _loading = true;
    });

    final success = await _controller.login(
      _usernameController.text,
      _passwordController.text,
    );

    if (!mounted) return;

    setState(() {
      _loading = false;
    });

    if (success) {
      AuthService.login(_usernameController.text);
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      const snackBehavior = SnackBarBehavior.floating;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          behavior: snackBehavior,
          action: SnackBarAction(
            label: "X",
            textColor: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
          content: const Text(
            "Credenciais Inválidas",
            style: TextStyle(
              fontSize: 18,
              fontFamily: "RobotoMono",
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final bottomInset = View.of(context).viewInsets.bottom;
      final keyboardNowVisible = bottomInset > 0;

      if (_keyboardVisible != keyboardNowVisible) {
        setState(() {
          _keyboardVisible = keyboardNowVisible;
        });
      }

      if (bottomInset > 0) {
        _scrollToBottom();
      }
    });
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 350), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D1F1A),
              Color(0xFF1F3C34),
              Color(0xFF2E5C4B),
              Color(0xFF38755E),
            ],
            stops: [0.0, 0.25, 0.50, 1.0],
          ),
        ),
        child: Stack(
          children: [
            ListView(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 32),
              children: [
                const SizedBox(height: 50),
                const LogoDesignWidget(),
                const SizedBox(height: 25),
                CustomTextField(
                  isObscure: false,
                  icon: const Icon(Icons.person),
                  text: "E-mail ou CPF",
                  inputController: _usernameController,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  isObscure: true,
                  icon: const Icon(Icons.password),
                  text: "Sua senha",
                  inputController: _passwordController,
                ),
                const SizedBox(height: 20),


                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/register");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2E7D32),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          shadowColor: Colors.black.withOpacity(0.3),
                          elevation: 6,
                        ),
                        child: const Text(
                          "Cadastrar",
                          style: TextStyle(
                            fontFamily: "RobotoMono",
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _loading ? null : _handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2E7D32),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          shadowColor: Colors.black.withOpacity(0.3),
                          elevation: 6,
                        ),
                        child: Text(
                          _loading ? "Validando..." : "Entrar",
                          style: const TextStyle(
                            fontFamily: "RobotoMono",
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/forgot");
                    },
                    child: const Text(
                      "Esqueceu sua Senha?",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "RobotoMono",
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        height: -2.20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
