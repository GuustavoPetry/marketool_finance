import 'package:flutter/material.dart';
import 'package:marketool_financer/src/services/auth_service.dart';
import 'package:marketool_financer/src/views/login_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "👋Olá, ${AuthService.username}",
        style: TextStyle(
          fontFamily: "RobotoMono",
          fontWeight: FontWeight.w500,
          color: const Color(0xFFF8F9F7),
        ),
      ),
      backgroundColor: const Color(0xFF2E7D32),
      iconTheme: IconThemeData(color: const Color(0xFFF8F9F7)),
      actions: [
        IconButton(
          onPressed: () {
            AuthService.logout();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => LoginView()),
              (route) => false,
            );
          },
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }
}
