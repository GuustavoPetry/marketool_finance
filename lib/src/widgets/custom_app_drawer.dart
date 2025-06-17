import 'package:flutter/material.dart';
import 'package:marketool_financer/src/app/app_menu_items.dart';
import 'package:marketool_financer/src/services/auth_service.dart';
import 'package:marketool_financer/src/views/login_view.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFFDDDFDB),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: const Color(0xFF4CAF50),
              height: 100,
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsetsGeometry.only(top: 30, bottom: 10),
                child: Center(child: Image.asset("assets/images/darkLogo.png")),
              ),
            ),
            ...appMenuItems.map(
              (item) => ListTile(
                leading: Icon(item.icon),
                title: Text(
                  item.title,
                  style: TextStyle(fontFamily: "RobotoMono"),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, item.route);
                },
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: Text(
                "Sair",
                style: TextStyle(fontFamily: "RobotoMono", color: Colors.red),
              ),
              onTap: () {
                AuthService.logout();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => LoginView()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
