import 'package:flutter/material.dart';
import 'package:marketool_financer/src/services/auth_service.dart';
import 'package:marketool_financer/src/views/login_view.dart';
import 'package:marketool_financer/src/widgets/custom_user_card.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 330,
      child: Container(
        color: const Color(0xFFDDDFDB),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              width: double.infinity,
              color: const Color(0xFF4CAF50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 20),
                    child: Text(
                      "Menu",
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: "RobotoMono",
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 20),
                    child: IconButton(
                      icon: Icon(Icons.close),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),

            Container(
              color: const Color(0xFF4CAF50),
              height: 120,
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsetsGeometry.only(top: 5, bottom: 5),
                child: Container(
                  width: 320,
                  height: 100,
                  alignment: Alignment.center,
                  child: CustomUserCard(
                    nome: "${AuthService.username}",
                    email: "ogustavopetry@gmail.com",
                    avatarUrl:
                        "https://avatars.githubusercontent.com/u/172058538?v=4",
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home", style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/home");
              },
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text("Meu Patrimônio", style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/patrimony");
              },
            ),
            ListTile(
              leading: Icon(Icons.file_upload),
              title: Text("Importar Notas", style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/upload");
              },
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
