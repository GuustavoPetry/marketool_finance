import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketool_finance/app/_core/routes/app_routes.dart';

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
            onPressed: () {
              Get.toNamed(AppRoutes.home);
            },
          ),

          IconButton(
            icon: const Icon(Icons.show_chart),
            tooltip: 'Gráficos',
            iconSize: 40,
            onPressed: () {},
          ),

          IconButton(
            icon: const Icon(Icons.file_download),
            tooltip: 'Importar dados',
            iconSize: 40,
            onPressed: () {
              Get.toNamed(AppRoutes.upload);
            },
          ),
        ],
      ),
    );
  }
}
