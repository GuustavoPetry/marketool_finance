import 'package:flutter/material.dart';
import 'security_page.dart'; // Certifique-se de importar a página correta

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFE8F5E9),
            Color(0xFFC8E6C9),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          _buildHelpCard(
            context: context,
            title: "Como usar o app?",
            description: "Aprenda a navegar, investir e acompanhar sua carteira.",
            icon: Icons.help_outline,
            onTap: () {}, // Ainda não implementado
          ),
          _buildHelpCard(
            context: context,
            title: "Segurança",
            description: "Veja como mantemos seus dados seguros.",
            icon: Icons.security,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SecurityPage()),
              );
            },
          ),
          _buildHelpCard(
            context: context,
            title: "Contato com suporte",
            description: "Precisa de ajuda? Fale conosco diretamente.",
            icon: Icons.contact_support,
            onTap: () {}, // Ainda não implementado
          ),
          _buildHelpCard(
            context: context,
            title: "Perguntas Frequentes",
            description: "Dúvidas comuns e suas respostas rápidas.",
            icon: Icons.question_answer,
            onTap: () {}, // Ainda não implementado
          ),
        ],
      ),
    );
  }

  Widget _buildHelpCard({
    required BuildContext context,
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
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