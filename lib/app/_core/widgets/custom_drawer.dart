import 'package:marketool_finance/app/_core/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  ThemeController().isDarkMode.value ? "Tema Claro" : "Tema Escuro",
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
      );
  }
}