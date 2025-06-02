import 'package:marketool_finance/app/_core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("MarkeTool Finance"),
      actions: [
        IconButton(
          onPressed: () {
            Get.offAllNamed(AppRoutes.login);
          },
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
