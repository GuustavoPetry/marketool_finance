import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketool_financer/src/app/app_menu_items.dart';
import 'package:marketool_financer/src/services/auth_service.dart';
import 'package:marketool_financer/src/views/login_view.dart';
import 'package:marketool_financer/src/widgets/custom_user_card.dart';

class CustomAppDrawer extends StatefulWidget {
  const CustomAppDrawer({super.key});

  @override
  State<CustomAppDrawer> createState() => _CustomAppDrawerState();
}

class _CustomAppDrawerState extends State<CustomAppDrawer> {
  File? _fotoPerfil;

  Future<void> _selecionarFoto() async {
    final picker = ImagePicker();
    final imagem = await picker.pickImage(source: ImageSource.gallery);

    if (imagem != null) {
      setState(() {
        _fotoPerfil = File(imagem.path);
      });
    }
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
              color: const Color(0xFF4CAF50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15, left: 20),
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
                    padding: const EdgeInsets.only(top: 15),
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      color: Colors.white,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 120,
              color: const Color(0xFF4CAF50),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Stack(
                  children: [
                    Container(
                      width: 320,
                      height: 100,
                      alignment: Alignment.center,
                      child: CustomUserCard(
                        nome: AuthService.username ?? '',
                        email: "ogustavopetry@gmail.com",
                        avatarUrl: "https://avatars.githubusercontent.com/u/172058538?v=4",
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.black),
                        onPressed: () {
                          final nomeController = TextEditingController(text: AuthService.username ?? '');
                          final emailController = TextEditingController(text: "ogustavopetry@gmail.com");

                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            ),
                            builder: (_) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).viewInsets.bottom,
                                  left: 16,
                                  right: 16,
                                  top: 16,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Editar Perfil',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    GestureDetector(
                                      onTap: _selecionarFoto,
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 40,
                                            backgroundImage: _fotoPerfil != null
                                                ? FileImage(_fotoPerfil!)
                                                : const NetworkImage("https://avatars.githubusercontent.com/u/172058538?v=4") as ImageProvider,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Clique para alterar a foto',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    TextField(
                                      controller: nomeController,
                                      decoration: const InputDecoration(
                                        labelText: 'Nome',
                                        hintText: 'Digite seu nome',
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    TextField(
                                      controller: emailController,
                                      decoration: const InputDecoration(
                                        labelText: 'Email',
                                        hintText: 'Digite seu email',
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          AuthService.username = nomeController.text;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Salvar Alterações'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            ...appMenuItems.map(
              (item) => ListTile(
                leading: Icon(item.icon),
                title: Text(
                  item.title,
                  style: const TextStyle(fontFamily: "RobotoMono"),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, item.route);
                },
              ),
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Usuário"),
              onTap: () => Navigator.pushNamed(context, '/usuario'),
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                "Sair",
                style: TextStyle(fontFamily: "RobotoMono", color: Colors.red),
              ),
              onTap: () {
                AuthService.logout();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginView()),
                  (_) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
