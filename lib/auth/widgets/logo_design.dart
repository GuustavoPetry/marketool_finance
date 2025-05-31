import 'package:flutter/material.dart';

class LogoDesign extends StatelessWidget {
  const LogoDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 40),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              "https://images.unsplash.com/photo-1662144374178-753a74fa28fb?q=80&fit=crop&w=1200&h=1200",
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 24),
          Text(
            "MarkeTool",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 8),
          Text(
            "Gestão de Investimentos",
            style: TextStyle(
              fontSize: 18,
              color: Colors.blueGrey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
