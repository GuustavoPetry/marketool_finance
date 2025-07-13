import 'package:flutter/material.dart';
import 'package:marketool_financer/src/views/suport_view.dart';
import 'security_page.dart';

class HelpCenterView extends StatefulWidget {
  const HelpCenterView({super.key});

  @override
  State<HelpCenterView> createState() => _HelpCenterViewState();
}

class _HelpCenterViewState extends State<HelpCenterView> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFE8F5E9), // Um verde bem claro/menta
            Color(0xFFC8E6C9), // Um verde claro um pouco mais escuro
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30), // Aumentado o preenchimento vertical
      child: Column( // Alterado para Column para controlar melhor o espaçamento e posicionar a seção animada
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
                  onTap: () {}, // Ainda não implementado
                ),
              ],
            ),
          ),
          FadeTransition( // Aplica a animação de fade-in
            opacity: _fadeInAnimation,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20), // Preenchimento em torno da seção de perguntas
              child: Column(
                mainAxisSize: MainAxisSize.min, // Usa o mínimo de espaço
                children: const [
                  Icon(
                    Icons.contact_support_outlined, // Uma variante ligeiramente mais moderna do ícone de ajuda
                    color: Color(0xFF2E7D32), // Verde mais escuro para contraste
                    size: 50, // Ligeiramente maior
                  ),
                  SizedBox(height: 15), // Espaçamento aumentado
                  Text(
                    "Como podemos ajudar?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontSize: 22, // Tamanho de fonte maior para destaque
                      fontWeight: FontWeight.w600, // Ligeiramente mais negrito
                      color: Color(0xFF2E7D32), // Combinando com a cor do ícone
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
      elevation: 6, // Elevação aumentada para um efeito flutuante
      margin: const EdgeInsets.symmetric(vertical: 12), // Um pouco mais de margem vertical
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // Cantos mais arredondados
      child: InkWell( // Usa InkWell para um melhor feedback de toque
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Mais preenchimento interno
          child: Row(
            children: [
              Icon(icon, color: const Color(0xFF388E3C), size: 36), // Ícone ligeiramente maior
              const SizedBox(width: 15), // Espaçamento entre o ícone e o texto
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'RobotoMono',
                        fontWeight: FontWeight.bold,
                        fontSize: 18, // Título ligeiramente maior
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
              const Icon(Icons.arrow_forward_ios, color: Colors.black38, size: 18), // Seta sutil de avançar
            ],
          ),
        ),
      ),
    );
  }
}