import 'package:flutter/material.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          _buildHelpCard(
            title: "Como usar o app?",
            description:
                "Aprenda a navegar, investir e acompanhar sua carteira.",
            icon: Icons.help_outline,
            onTap: () {
              Navigator.pushNamed(context, '/how');
            },
          ),
          _buildHelpCard(
            title: "Segurança",
            description: "Veja como mantemos seus dados seguros.",
            icon: Icons.security,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Página de Segurança em desenvolvimento'),
                ),
              );
            },
          ),
          _buildHelpCard(
            title: "Contato com suporte",
            description: "Precisa de ajuda? Fale conosco diretamente.",
            icon: Icons.contact_support,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Página de Contato em desenvolvimento'),
                ),
              );
            },
          ),
          _buildHelpCard(
            title: "Perguntas Frequentes",
            description: "Dúvidas comuns e suas respostas rápidas.",
            icon: Icons.question_answer,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('FAQ em desenvolvimento')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHelpCard({
    required String title,
    required String description,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF388E3C), size: 32),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(fontFamily: 'RobotoMono'),
        ),
        onTap: onTap,
      ),
    );
  }
}
