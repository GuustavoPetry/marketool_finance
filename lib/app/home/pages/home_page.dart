import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketool_finance/app/_core/controllers/theme_controller.dart';
import 'package:marketool_finance/app/home/controllers/home_controller.dart';
import 'package:marketool_finance/app/_core/widgets/chart_icon.dart';
import 'package:marketool_finance/app/_core/widgets/logout_button.dart';
import 'package:marketool_finance/app/_core/widgets/settings_icon.dart';
import 'package:marketool_finance/app/_core/widgets/wallet_icon.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MarkeTool Finance"),
        actions: [LogoutButton()],
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("Menu", style: Theme.of(context).textTheme.bodyLarge),
            ),

            ListTile(
              leading: Icon(Icons.account_box_rounded),
              title: Text(
                "Minha Conta",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () {},
            ),

            ListTile(
              leading: Icon(Icons.request_quote_outlined),
              title: Text(
                "Resultados",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () {},
            ),
            
            Obx(
              () => SwitchListTile(
                value: themeController.isDarkMode.value,
                onChanged: (_) => themeController.toggleTheme(),
                title: Text(
                  themeController.isDarkMode.value ? "Tema Claro" : "Tema Escuro",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                activeColor: Colors.green[400],
                inactiveThumbColor: Colors.green[800],
                activeTrackColor: Colors.lightGreenAccent,
                inactiveTrackColor: Colors.green[200],
              ),
            ),
          ],
        ),
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
  return ListView();
}
