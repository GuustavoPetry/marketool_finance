import 'package:flutter/material.dart';
import 'package:marketool_financer/src/services/auth_service.dart';

class UserProfileViews extends StatelessWidget {
  const UserProfileViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 24),

            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/user_avatar.png'),
              backgroundColor: Colors.grey,
            ),

            const SizedBox(height: 16),

            const Text(
              'nome',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 4),

            const Text('email',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey
              ),
            ),

            const SizedBox(height: 24),
            Divider(color: Colors.grey[300]),
            const SizedBox(height: 16),

            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Editar perfil'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushNamed(context, "/editar_perfil");
              }
            ),

            ListTile(
              leading: const Icon(Icons.trending_up),
              title: const Text('Ver Retornos'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushNamed(context, "/retornos");
              }
            ),

              ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Voltar para Início'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                 Navigator.pushReplacementNamed(context, "/home");
              }
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sair da conta'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                AuthService.logout();
                Navigator.pushReplacementNamed(context, "/login");
              }
            ),
          ]
        ),
      ),
    );
  }
}
