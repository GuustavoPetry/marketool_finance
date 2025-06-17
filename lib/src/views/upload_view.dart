import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  bool _loading = false;

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
    return Center(
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(24),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.picture_as_pdf,
                size: 100,
                color: const Color(0xFF2E7D32),
              ),
              const SizedBox(height: 20),
              const Text(
                'Selecione um arquivo PDF para importar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: _loading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(Icons.file_upload),
                label: Text(_loading ? "Carregando..." : "Selecionar PDF"),
                onPressed: _loading ? null : _handlePdfSelection,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D32),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
