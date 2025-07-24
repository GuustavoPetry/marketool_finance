import 'package:flutter/material.dart';

class FirebaseRegisterView extends StatefulWidget {
  const FirebaseRegisterView({super.key});

  @override
  State<FirebaseRegisterView> createState() => _FirebaseRegisterViewState();
}

class _FirebaseRegisterViewState extends State<FirebaseRegisterView>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _nomeController = TextEditingController();
  bool _isLoading = false;

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _nomeController.dispose();
    super.dispose();
  }

  void _cadastrar() async {
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
          // Fundo com gradiente
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
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.person_add_alt_1,
                          size: 60, color: Color(0xFF00C86F)),
                      const SizedBox(height: 12),
                      const Text(
                        'Crie sua conta',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
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
                                controller: _nomeController,
                                hint: 'Nome completo',
                                icon: Icons.person_outline,
                              ),
                              const SizedBox(height: 16),
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
                              _buildCadastroButton(),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Voltar para login
                        },
                        child: const Text(
                          'Já tenho uma conta',
                          style: TextStyle(color: Color(0xFF00C86F)),
                        ),
                      ),
                    ],
                  ),
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

  Widget _buildCadastroButton() {
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
        onPressed: _isLoading ? null : _cadastrar,
        child: _isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text(
                'Cadastrar',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
      ),
    );
  }
}
