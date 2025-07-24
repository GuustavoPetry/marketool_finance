import 'package:flutter/material.dart';

class FirebaseLoginView extends StatefulWidget {
  const FirebaseLoginView({super.key});

  @override
  State<FirebaseLoginView> createState() => _FirebaseLoginViewState();
}

class _FirebaseLoginViewState extends State<FirebaseLoginView>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _isLoading = false;
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.4),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 2));
      setState(() => _isLoading = false);

      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fundo
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF001F1A), Color(0xFF0E1E1B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Conteúdo
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: SlideTransition(
                position: _offsetAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.trending_up_rounded,
                      size: 60,
                      color: Color(0xFF00C86F),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Marketool',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Controle financeiro premium',
                      style: TextStyle(fontSize: 15, color: Colors.white70),
                    ),
                    const SizedBox(height: 40),

                    // Formulário
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white10),
                      ),
                      padding: const EdgeInsets.all(24),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            _buildTextField(
                              controller: _emailController,
                              hint: 'E-mail',
                              icon: Icons.email_outlined,
                            ),
                            const SizedBox(height: 16),
                            _buildTextField(
                              controller: _senhaController,
                              hint: 'Senha',
                              icon: Icons.lock_outline,
                              obscure: true,
                            ),
                            const SizedBox(height: 28),
                            _buildLoginButton(),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cadastro');
                      },
                      child: const Text(
                        'Criar conta gratuita',
                        style: TextStyle(color: Color(0xFF00C86F)),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscure = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white54),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white60),
        filled: true,
        fillColor: Colors.white.withOpacity(0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Campo obrigatório';
        if (hint == 'E-mail' && !value.contains('@')) return 'E-mail inválido';
        if (hint == 'Senha' && value.length < 6) return 'Senha muito curta';
        return null;
      },
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00C86F),
          foregroundColor: Colors.black,
          shadowColor: Colors.black54,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: _isLoading ? null : _login,
        child:
            _isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text(
                  'Entrar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
      ),
    );
  }
}
