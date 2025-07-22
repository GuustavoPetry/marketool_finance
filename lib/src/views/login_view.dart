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

class _LoginViewState extends State<LoginView> {
  final _controller = LoginController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;

  void _handleLogin() async {
    setState(() {
      _loading = true;
    });

    final sucess = await _controller.loginWithCPF(
      _usernameController.text,
      _passwordController.text,
    );
    setState(() => _loading = false);

    if (success) {
      AuthService.login(_usernameController.text);
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Credenciais inválidas'),
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
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
              children: [
                SizedBox(height: 50),
                LogoDesignWidget(),
                SizedBox(height: 25),
                CustomTextField(
                  isObscure: false,
                  icon: Icon(Icons.person),
                  text: "E-mail ou CPF",
                  inputController: _usernameController,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  isObscure: true,
                  icon: Icon(Icons.password),
                  text: "Sua senha",
                  inputController: _passwordController,
                ),
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomButton(
                        onPressed: _loading ? null : _handleLogin,
                        label: _loading ? "Validando..." : "Entrar",
                      ),
                      const SizedBox(height: 20),
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
                    ],
                  ),
                  child: Icon(Icons.attach_money, color: accentGreen, size: 40),
                ),
              ],
            ),
            Visibility(
              visible: !_keyboardVisible,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 300,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color(0xFF2E7D32),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/register");
                    },
                    child: Text(
                      "Crie Sua Conta Agora Mesmo\nClique para Cadastrar",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "RobotoMono",
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    bool obscure = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.w500,
            fontSize: 15,
            fontFamily: "RobotoMono",
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(14),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscure,
            style: const TextStyle(color: Colors.black87, fontSize: 16),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.grey[400]),
              hintText: label,
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: _loading ? null : _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: darkGreen,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          child: _loading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 3,
                  ),
                )
              : const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "RobotoMono",
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildRegisterLink() {
    return Center(
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, "/register"),
        child: RichText(
          text: TextSpan(
            text: "Não tem uma conta? ",
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15,
              fontFamily: "RobotoMono",
            ),
            children: [
              TextSpan(
                text: "Criar conta",
                style: TextStyle(
                  color: accentGreen,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontSize: 15,
                  fontFamily: "RobotoMono",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black;
    const double s = 32;
    for (double x = 0; x < size.width; x += s) {
      for (double y = 0; y < size.height; y += s) {
        if ((x ~/ s + y ~/ s) % 2 == 0) {
          canvas.drawRect(Rect.fromLTWH(x, y, s / 2, s / 2), paint);
        } else {
          canvas.drawCircle(Offset(x + s / 2, y + s / 2), s / 4, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}