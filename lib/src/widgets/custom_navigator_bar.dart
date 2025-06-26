import 'package:flutter/material.dart';
import 'package:marketool_financer/src/app/tutorial_keys.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              key: homePageKey,
              icon: Icon(Icons.home, color: const Color(0xFFF8F9F7)),
              tooltip: 'Home',
              iconSize: 40,
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/home");
              },
            ),

            IconButton(
              key: patrimonyKey,
              icon: const Icon(Icons.show_chart, color: Color(0xFFF8F9F7)),
              tooltip: 'Gráficos',
              iconSize: 40,
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/patrimony");
              },
            ),

            IconButton(
              key: uploadKey,
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
