import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadController extends GetxController {
  Future<void> pickPdf() async {
    final typeGroup = XTypeGroup(label: 'PDF', extensions: ['pdf']);

    final file = await openFile(acceptedTypeGroups: [typeGroup]);

    if (file != null) {
      Get.snackbar(
        'Sucesso',
        'Arquivo selecionado: ${file.name}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.shade100,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Cancelado',
        'Nenhum arquivo selecionado',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
    }
  }
}
