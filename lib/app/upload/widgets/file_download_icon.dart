import 'package:marketool_finance/app/_core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadIcon extends StatelessWidget {
  const UploadIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.file_download),
      tooltip: 'Importar dados',
      iconSize: 40,
      onPressed: () {
        Get.offAllNamed(AppRoutes.upload);
      },
    );
  }
}