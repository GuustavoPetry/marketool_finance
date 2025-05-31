import 'package:flutter/material.dart';
import 'package:marketool_finance/app/home/widgets/chart_icon.dart';
import 'package:marketool_finance/app/home/widgets/logout_button.dart';
import 'package:marketool_finance/app/home/widgets/settings_icon.dart';
import 'package:marketool_finance/app/home/widgets/wallet_icon.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        leading: const Icon(Icons.person),
        actions: [LogoutButton()],
      ),

      body: _body(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WalletIcon(),

            const SizedBox(width: 32),
            ChartIcon(),

            const SizedBox(width: 32),
            SettingsIcon(),
          ],
        ),
      ),
    );
  }
}

Widget _body() {
  return const Center(child: Text("conteudo principal aqui"));
}
