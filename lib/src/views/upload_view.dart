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
    final typeGroup = XTypeGroup(label: 'PDF', extensions: ['pdf']);

    final files = await openFiles(acceptedTypeGroups: [typeGroup]);

    if (!mounted) return;

    if (files.isNotEmpty) {
      setState(() {
        selectedFiles = files.length;
      });
    } else {
      const snackBehavior = SnackBarBehavior.floating;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Nenhum arquivo selecionado",
            style: TextStyle(
              fontSize: 14,
              fontFamily: "RobotoMono",
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.redAccent,
          behavior: snackBehavior,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide.none,
        ),
        margin: const EdgeInsets.all(24),
        color: Colors.grey.withValues(alpha: 0.30),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.picture_as_pdf, size: 100, color: Colors.green),
              const SizedBox(height: 35),
              const Text(
                'Faça Upload das suas Notas de Corretagem',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "RobotoMono",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
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
              const SizedBox(height: 30),
              Text(
                selectedFiles > 0
                    ? "$selectedFiles arquivos selecionados"
                    : "*Nenhum arquivo selecionado*",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "RobotoMono",
                  fontWeight: FontWeight.w400,
                  color: selectedFiles > 0 ? Colors.green : Colors.red,
                ),
              ),

              const SizedBox(height: 40),
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
      ),
    );
  }
}
