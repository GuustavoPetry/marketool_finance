import 'package:flutter/material.dart';
import 'package:marketool_financer/src/services/auth_service.dart';

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
            Navigator.pushNamed(context, "/search-assets");
          },
          icon: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: const Icon(Icons.search_rounded),
          ),
        ),
      ],
    );
  }
}
