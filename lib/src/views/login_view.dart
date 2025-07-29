import 'package:flutter/material.dart';
import 'package:marketool_financer/src/controllers/login_controller.dart';
import 'package:marketool_financer/src/services/auth_service.dart';
import 'package:marketool_financer/src/widgets/custom_button.dart';
import 'package:marketool_financer/src/widgets/custom_text_field.dart';
import 'package:marketool_financer/src/widgets/custom_logo_design.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  final _controller = LoginController();
  final _scrollController = ScrollController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  bool _keyboardVisible = false;
  bool _loading = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _offsetAnimation =
        Tween<Offset>(begin: const Offset(0.0, 0.4), end: Offset.zero).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    _animationController.forward();
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
    /// Aguarda o próximo frame para ter acesso ao contexto
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
    Future.delayed(Duration(milliseconds: 350), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _handleLogin() async {
    setState(() {
      _loading = true;
    });

    final sucess = await _controller.loginWithCPF(
      _usernameController.text,
      _passwordController.text,
    );

    if (!mounted) return;

    setState(() {
      _loading = false;
    });

    if (sucess) {
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
          content: Text(
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF001F1A), Color(0xFF0E1E1B)],
          ),
        ),
        child: SlideTransition(
          position: _offsetAnimation,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 32),
            controller: _scrollController,
            children: [
              SizedBox(height: 50),
              LogoDesignWidget(),
              SizedBox(height: 25),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white10),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    CustomTextField(
                      isObscure: false,
                      icon: Icon(Icons.email_outlined, color: Colors.white70),
                      text: "E-mail ou CPF",
                      inputController: _usernameController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      isObscure: true,
                      icon: Icon(
                        Icons.lock_clock_outlined,
                        color: Colors.white70,
                      ),
                      text: "Sua senha",
                      inputController: _passwordController,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      onPressed: _loading ? null : _handleLogin,
                      label: _loading ? "Validando..." : "Entrar",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Esqueceu sua Senha?",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "RobotoMono",
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Visibility(
                visible: !_keyboardVisible,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/register");
                    },
                    child: Text(
                      "Ainda não tem conta?\nCrie Agora",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "RobotoMono",
                        color: Colors.lightGreen,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
