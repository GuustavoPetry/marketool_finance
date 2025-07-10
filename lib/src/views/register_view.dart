import 'package:flutter/material.dart';
import 'package:marketool_financer/src/controllers/register_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _controller = RegisterController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  bool _loading = false;

  Future<void> _handleRegister() async {
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _loading = false);
    Navigator.pushReplacementNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    final darkGreen = const Color(0xFF145A32);
    final accentGreen = const Color(0xFF48C9B0);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 370,
            margin: const EdgeInsets.symmetric(vertical: 24),
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
              mainAxisSize: MainAxisSize.min,
              children: [
                // Topo com fundo escuro, padrão geométrico e logo central
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: darkGreen,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
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
                      Center(
                        child: Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(Icons.person_add, color: accentGreen, size: 38),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          "Registre-se",
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
                        label: "Nome Completo",
                        controller: _nameController,
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 18),
                      _buildDatePicker(),
                      const SizedBox(height: 18),
                      _buildInputField(
                        label: "Email",
                        controller: _emailController,
                        icon: Icons.email_outlined,
                      ),
                      const SizedBox(height: 18),
                      _buildInputField(
                        label: "Telefone",
                        controller: _phoneController,
                        icon: Icons.phone,
                      ),
                      const SizedBox(height: 18),
                      _buildInputField(
                        label: "Senha",
                        controller: _passwordController,
                        icon: Icons.lock_outline,
                        obscure: true,
                      ),
                      const SizedBox(height: 18),
                      _buildInputField(
                        label: "Confirmar Senha",
                        controller: _confirmPasswordController,
                        icon: Icons.lock_outline,
                        obscure: true,
                      ),
                      const SizedBox(height: 28),
                      _buildRegisterButton(darkGreen),
                      const SizedBox(height: 24),
                      Center(
                        child: TextButton(
                          onPressed: () => Navigator.pushReplacementNamed(context, "/login"),
                          child: RichText(
                            text: TextSpan(
                              text: "Já tem uma conta? ",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 15,
                                fontFamily: "RobotoMono",
                              ),
                              children: [
                                TextSpan(
                                  text: "Entrar",
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
              ],
            ),
          ),
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

  Widget _buildDatePicker() {
    return GestureDetector(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: _selectedDate,
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (picked != null) {
          setState(() => _selectedDate = picked);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(14),
        ),
        height: 56,
        child: Row(
          children: [
            const SizedBox(width: 12),
            const Icon(Icons.calendar_today, color: Colors.grey),
            const SizedBox(width: 12),
            Text(
              "Data de Nascimento: ${_selectedDate.day.toString().padLeft(2, '0')}/"
              "${_selectedDate.month.toString().padLeft(2, '0')}/${_selectedDate.year}",
              style: const TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterButton(Color color) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: _loading ? null : _handleRegister,
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
                  "Registro",
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