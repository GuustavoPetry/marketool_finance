import 'package:flutter/material.dart';

class CustomAssetDetail extends StatelessWidget {
  const CustomAssetDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Text(
          "Mais Informações do ativo",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
