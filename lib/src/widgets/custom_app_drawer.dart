import 'package:flutter/material.dart';
import 'package:marketool_financer/src/app/app_menu_items.dart';
import 'package:marketool_financer/src/controllers/tutorial_controller.dart';
import 'package:marketool_financer/src/services/auth_service.dart';
import 'package:marketool_financer/src/views/login_view.dart';
import 'package:marketool_financer/src/widgets/custom_user_card.dart';

class CustomAppDrawer extends StatefulWidget {
  const CustomAppDrawer({super.key});

  @override
  State<CustomAppDrawer> createState() => _CustomAppDrawerState();
}

class _CustomAppDrawerState extends State<CustomAppDrawer> {
  void _showTutorialDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Iniciar Tutorial"),
        content: Text("Deseja iniciar o tutorial guiado pela aplicação?"),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: Text("Cancelar", style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Future.delayed(Duration(milliseconds: 300), () {
                if (!mounted) return;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (!mounted) return;
                  TutorialController(context).startTutorial();
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
            ListTile(
              leading: Icon(Icons.play_circle_fill),
              title: Text("Tutorial"),
              onTap: () {
                Navigator.pop(context);

                // O contexto raiz, pois AlertDialog já foi destruído nesse ponto.
                final BuildContext rootContext = context;

                // Aguarda para garantir que o Drawer já fechou.
                Future.delayed(Duration(milliseconds: 300), () {
                  if (!mounted) return;

                  _showTutorialDialog(rootContext);
                });
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

// class CustomAppDrawer extends StatelessWidget {
//   const CustomAppDrawer({super.key});

//   void _showTutorialDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: Text("Iniciar Tutorial"),
//         content: Text("Deseja iniciar o tutorial guiado pela aplicação?"),
//         actions: [
//           TextButton(
//             onPressed: Navigator.of(context).pop,
//             child: Text("Cancelar", style: TextStyle(color: Colors.red)),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.of(context).pop;
//               Future.delayed(Duration(milliseconds: 300), () {
//                 TutorialController(context).startTutorial();
//               });
//             },
//             child: Text("INICIAR", style: TextStyle(color: Colors.blue)),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       width: 330,
//       child: Container(
//         color: const Color(0xFFDDDFDB),
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             Container(
//               width: double.infinity,
//               color: const Color(0xFF4CAF50),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 15, left: 20),
//                     child: Text(
//                       "Menu",
//                       style: TextStyle(
//                         fontSize: 26,
//                         fontFamily: "RobotoMono",
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),

//                   Padding(
//                     padding: const EdgeInsets.only(top: 15, left: 20),
//                     child: IconButton(
//                       icon: Icon(Icons.close),
//                       color: Colors.white,
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             Container(
//               color: const Color(0xFF4CAF50),
//               height: 120,
//               alignment: Alignment.center,
//               child: Padding(
//                 padding: EdgeInsetsGeometry.only(top: 5, bottom: 5),
//                 child: Container(
//                   width: 320,
//                   height: 100,
//                   alignment: Alignment.center,
//                   child: CustomUserCard(
//                     nome: "${AuthService.username}",
//                     email: "ogustavopetry@gmail.com",
//                     avatarUrl:
//                         "https://avatars.githubusercontent.com/u/172058538?v=4",
//                   ),
//                 ),
//               ),
//             ),
//             ...appMenuItems.map(
//               (item) => ListTile(
//                 leading: Icon(item.icon),
//                 title: Text(
//                   item.title,
//                   style: TextStyle(fontFamily: "RobotoMono"),
//                 ),
//                 onTap: () {
//                   Navigator.pushReplacementNamed(context, item.route);
//                 },
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.play_circle_fill),
//               title: Text("Tutorial"),
//               onTap: () {
//                 Navigator.pop(context);

//                 // O contexto raiz, pois AlertDialog já foi destruído nesse ponto.
//                 final BuildContext rootContext = context;

//                 // Aguarda para garantir que o Drawer já fechou.
//                 Future.delayed(Duration(milliseconds: 300), () {
//                   _showTutorialDialog(rootContext);
//                 });
//               },
//             ),
//             const Divider(),
//             ListTile(
//               leading: const Icon(Icons.logout, color: Colors.red),
//               title: Text(
//                 "Sair",
//                 style: TextStyle(fontFamily: "RobotoMono", color: Colors.red),
//               ),
//               onTap: () {
//                 AuthService.logout();
//                 Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (_) => LoginView()),
//                   (route) => false,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
