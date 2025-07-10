import 'package:flutter/material.dart';
import 'package:marketool_financer/src/controllers/login_controller.dart';
import 'package:marketool_financer/src/services/auth_service.dart';

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

  Future<void> _handleLogin() async {
    setState(() => _loading = true);
    final success = await _controller.loginWithCPF(
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
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final darkGreen = const Color(0xFF145A32);
    final accentGreen = const Color(0xFF48C9B0);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: Stack(
        children: [
          // Topo com padrão geométrico, nome do app e logo central
          Container(
            height: 220,
            decoration: BoxDecoration(
              color: darkGreen,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(48),
                bottomRight: Radius.circular(48),
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.18,
                    child: CustomPaint(
                      painter: _PatternPainter(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.7),
                  child: Text(
                    "marketool",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: "RobotoMono",
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.5),
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: accentGreen.withOpacity(0.18),
                          blurRadius: 12,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(Icons.attach_money, color: accentGreen, size: 40),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Container(
                margin: const EdgeInsets.only(top: 140, bottom: 24, left: 24, right: 24),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: accentGreen.withOpacity(0.10),
                      blurRadius: 32,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900],
                          fontFamily: "RobotoMono",
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    _buildInputField(
                      label: "Email",
                      controller: _usernameController,
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 18),
                    _buildInputField(
                      label: "Senha",
                      controller: _passwordController,
                      icon: Icons.lock_outline,
                      obscure: true,
                    ),
                    const SizedBox(height: 28),
                    _buildLoginButton(darkGreen),
                    const SizedBox(height: 24),
                    Center(
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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

  Widget _buildLoginButton(Color color) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: _loading ? null : _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
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
}

// Padrão geométrico fake para o topo (substitua por SVG para ficar idêntico)
class _PatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black;
    final double s = 32;
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