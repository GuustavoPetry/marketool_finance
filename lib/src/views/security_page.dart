import 'package:flutter/material.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        title: const Text('Segurança'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Protegendo o que é seu',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono',
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Conheça as medidas que tomamos para proteger seus dados com responsabilidade e transparência.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 32),

              _buildSection(
                icon: Icons.lock,
                title: 'Criptografia',
                description:
                    'Todas as suas informações são criptografadas de ponta a ponta. Só você tem acesso aos seus dados.',
              ),
              _buildSection(
                icon: Icons.verified_user,
                title: 'Autenticação verificada',
                description:
                    'Contas protegidas por e-mail verificado. Em breve, autenticação em duas etapas (2FA).',
              ),
              _buildSection(
                icon: Icons.storage,
                title: 'Infraestrutura confiável',
                description:
                    'Usamos servidores seguros, alinhados à LGPD e monitorados 24/7 contra acessos não autorizados.',
              ),
              _buildSection(
                icon: Icons.shield,
                title: 'Detecção de ameaças',
                description:
                    'Tecnologias que analisam e bloqueiam tentativas suspeitas em tempo real, sem você nem perceber.',
              ),
              _buildSection(
                icon: Icons.tips_and_updates,
                title: 'Recomendações úteis',
                description:
                    'Nunca compartilhe sua senha. Use e-mails confiáveis e senhas seguras com letras, números e símbolos.',
              ),

              const SizedBox(height: 40),
              const Divider(thickness: 1, color: Colors.black26),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: const [
                    Text(
                      'Ficou com dúvidas?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'RobotoMono',
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Fale com nosso suporte: suporte@marketool.com',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 32, color: const Color(0xFF2E7D32)),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'RobotoMono',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}