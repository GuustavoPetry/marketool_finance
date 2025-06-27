import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marketool_financer/src/providers/tutorial_keys_provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    final tutorialKeys = Provider.of<TutorialKeysProvider>(
      context,
      listen: false,
    );

    return Container(
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              key: tutorialKeys.keyHomePage,
              icon: Icon(Icons.home, color: const Color(0xFFF8F9F7)),
              tooltip: 'Home',
              iconSize: 40,
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/home");
              },
            ),

            IconButton(
              key: tutorialKeys.keyPatrimony,
              icon: const Icon(Icons.show_chart, color: Color(0xFFF8F9F7)),
              tooltip: 'Gráficos',
              iconSize: 40,
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/patrimony");
              },
            ),

            IconButton(
              key: tutorialKeys.keyUpload,
              icon: const Icon(Icons.file_download, color: Color(0xFFF8F9F7)),
              tooltip: 'Importar Notas',
              iconSize: 40,
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/upload");
              },
            ),
          ],
        ),
      ),
    );
  }
}
