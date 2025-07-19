import 'package:flutter/material.dart';
import 'package:marketool_financer/src/views/suport_view.dart';
import 'security_page.dart';

class HelpCenterView extends StatelessWidget { // Mudado para StatelessWidget
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SuportPage()),
                    );
                  },
                ),
                _buildHelpCard(
                  context: context,
                  title: "Perguntas Frequentes",
                  description: "Dúvidas comuns e suas respostas rápidas.",
                  icon: Icons.contact_support_outlined,
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.contact_support_outlined, 
                  color: Color(0xFF2E7D32), 
                  size: 50,
                ),
                SizedBox(height: 15),
                Text(
                  "Como podemos ajudar?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2E7D32),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Sua tranquilidade é nossa prioridade.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
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
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, color: const Color(0xFF388E3C), size: 36),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'RobotoMono',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        fontFamily: 'RobotoMono',
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.black38, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}