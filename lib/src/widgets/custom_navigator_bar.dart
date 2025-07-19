import 'package:flutter/material.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 26, 24, 24), // Grafite escuro
            Color.fromARGB(255, 26, 24, 24), // Quase preto
          ],
        ),
        boxShadow: [],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _NavBarItem(
              icon: Icons.home_filled,
              label: 'Home',
              onPressed: () => Navigator.pushReplacementNamed(context, "/home"),
            ),
            _NavBarItem(
              icon: Icons.auto_graph_rounded,
              label: 'Gráficos',
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, "/patrimony"),
            ),
            _NavBarItem(
              icon: Icons.cloud_upload_rounded,
              label: 'Importar',
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, "/upload"),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white.withOpacity(0.08),
              border: Border.all(
                color: Colors.white.withOpacity(0.15),
                width: 1,
              ),
            ),
            child: Icon(icon, color: Colors.white.withOpacity(0.9), size: 20),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontSize: 11,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
