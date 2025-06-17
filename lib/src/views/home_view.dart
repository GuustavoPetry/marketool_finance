import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: ListView(
        children: [
          Text(
            "Página Inicial",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Text(
            """Precisamos renderizar uma tabela com informações dos ativos, vindo do banco de dados, como: """,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 30),
          Text(
            "NOME ATIVOS, VARIAÇÃO DIÁRIA (% E R\$), E VARIAÇÃO TOTAL (% E R\$)",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}