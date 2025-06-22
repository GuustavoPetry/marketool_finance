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

    final sucess = await _controller.login(
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
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF424242), // cinza mais escuro (grey[800])
            Color(0xFF616161), // cinza médio (grey[700])
            Color(0xFFE0E0E0), // cinza claro (grey[200])
            Color(0xFFF8F9F7), // branco suave
          ],
          stops: [
            0.0, // topo bem escuro
            0.40, // ainda escuro até 30%
            0.60, // clareando depois da imagem
            1.0, // branco no fim
          ],
        ),
      ),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF2E7D32),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: SafeArea(
              child: Center(
                child: Text(
                  "Bem-vindo Investidor",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "RobotoMono",
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            ListView(
              controller: _scrollController,
              children: [
                LogoDesignWidget(),

                CustomInputField(
                  isObscure: false,
                  icon: Icon(Icons.person),
                  text: "E-mail ou CPF",
                  inputController: _usernameController,
                ),

                const SizedBox(height: 10),
                CustomInputField(
                  isObscure: true,
                  icon: Icon(Icons.password),
                  text: "Sua senha",
                  inputController: _passwordController,
                ),

                const SizedBox(height: 10),

                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomButton(
                        onPressed: _loading ? null : _handleLogin,
                        label: _loading ? "Validando..." : "Entrar",
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Esqueceu sua Senha?",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "RobotoMono",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Visibility(
              visible: !_keyboardVisible,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Container(
                    width: double.infinity,
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
            ),
          ],
        ),
      ),
    );
  }
}
