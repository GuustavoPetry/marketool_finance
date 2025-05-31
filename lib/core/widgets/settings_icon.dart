import 'package:flutter/material.dart';

class SettingsIcon extends StatelessWidget {
  const SettingsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      tooltip: 'Configurações',
      iconSize: 40,
      onPressed: () {},
    );
  }
}
