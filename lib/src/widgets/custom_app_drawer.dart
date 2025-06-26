import 'package:flutter/material.dart';
import 'package:marketool_financer/src/controllers/tutorial_controller.dart';
import 'package:marketool_financer/src/services/auth_service.dart';
import 'package:marketool_financer/src/views/login_view.dart';
import 'package:marketool_financer/src/widgets/custom_user_card.dart';

class CustomAppDrawer extends StatelessWidget {
  CustomAppDrawer({super.key});

  final GlobalKey homePageKey = GlobalKey();
  final GlobalKey patrimonyKey = GlobalKey();
  final GlobalKey uploadKey = GlobalKey();

  void _showTutorialDialog(BuildContext safeContext) {
    showDialog(
      context: safeContext,
      builder: (dialogContext) => AlertDialog(
        title: Text("Iniciar Tutorial"),
        content: Text("Deseja iniciar o tutorial guiado pela aplicação?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text("Cancelar", style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();

              Future.delayed(Duration(milliseconds: 300), () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  TutorialController(
                    context: safeContext,
                    uploadKey: uploadKey,
                    patrimonyKey: patrimonyKey,
                    homePageKey: homePageKey,
                  ).startTutorial();
                });
              });
            },
            child: Text("INICIAR", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }

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
            Builder(
              builder: (BuildContext safeContext) {
                return ListTile(
                  leading: Icon(Icons.play_circle_fill),
                  title: Text("Tutorial"),
                  onTap: () {
                    Navigator.pop(safeContext); // Fecha o drawer

                    Future.delayed(Duration(milliseconds: 300), () {
                      _showTutorialDialog(
                        safeContext,
                      ); // Usa o contexto acima do Drawer
                    });
                  },
                );
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
