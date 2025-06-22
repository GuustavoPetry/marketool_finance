import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:marketool_financer/src/widgets/custom_button.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  bool _loading = false;
  int selectedFiles = 0;

  Future<void> _handlePdfSelection() async {
    setState(() {
      _loading = true;
    });

    final typeGroup = XTypeGroup(label: 'PDF', extensions: ['pdf']);

    final file = await openFile(acceptedTypeGroups: [typeGroup]);

    if (!mounted) return;

    setState(() {
      _loading = false;
    });

    const snackBehavior = SnackBarBehavior.floating;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          file != null
              ? "Arquivo selecionado: ${file.name}"
              : "Nenhum arquivo selecionado",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: file != null
            ? Colors.lightGreenAccent
            : Colors.redAccent,
        behavior: snackBehavior,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(24),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.picture_as_pdf,
              size: 80,
              color: const Color(0xFF2E7D32),
            ),
            const SizedBox(height: 20),
            const Text(
              'Faça Upload das suas Notas de Corretagem',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontFamily: "RobotoMono",
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            TextButton(
              onPressed: _handlePdfSelection,
              child: Text(
                ">>Importar Arquivos<<",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "RobotoMono",
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Colors.blueAccent,
                ),
              ),
            ),

            Text(
              selectedFiles > 0
                  ? "$selectedFiles arquivos selecionados"
                  : "Nenhum arquivo selecionado",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontFamily: "RobotoMono",
                fontWeight: FontWeight.w400,
                color: Colors.lightGreen,
              ),
            ),

            const SizedBox(height: 10),
            CustomButton(
              icon: _loading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Icon(Icons.send),
              label: _loading ? "Carregando" : "Enviar Notas",
              onPressed: _loading ? null : _handlePdfSelection,
            ),
          ],
        ),
      ),
    );
  }
}
