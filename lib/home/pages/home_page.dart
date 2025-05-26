import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        leading: const Icon(Icons.person),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.logout,
            ), // aqui é o botão de quando o usuário clica volta pro login
          ),
        ],
      ),
      body: _body(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.wallet),
              tooltip: 'Carteira',
              iconSize: 40,
              onPressed: () {
              },
            ),

            const SizedBox(width: 32),
            IconButton(
              icon: const Icon(Icons.show_chart),
              tooltip: 'Gráficos',
              iconSize: 40,
              onPressed: () {
              },
            ),

            const SizedBox(width: 32),
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Configurações',
              iconSize: 40,
              onPressed: () {

              },
            ),
          ],
        ),
      ),
    );
  }
  }

  Widget _body(){
    return const Center(
      child: Text("conteudo principal aqui"),
    );
  }