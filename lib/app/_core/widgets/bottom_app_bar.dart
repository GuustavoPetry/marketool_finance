import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.wallet),
            tooltip: 'Carteira',
            iconSize: 40,
            onPressed: () {},
          ),

          IconButton(
            icon: const Icon(Icons.show_chart),
            tooltip: 'Gráficos',
            iconSize: 40,
            onPressed: () {},
          ),

          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Configurações',
            iconSize: 40,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
