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
              Icons.home,
            ) /* aqui é o botão de quando o usuário clica volta pro menu */,
          ),
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container();
  }
}
