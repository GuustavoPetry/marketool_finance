import 'package:flutter/material.dart';

class WalletIcon extends StatelessWidget {
  const WalletIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.wallet),
      tooltip: 'Carteira',
      iconSize: 40,
      onPressed: () {},
    );
  }
}
