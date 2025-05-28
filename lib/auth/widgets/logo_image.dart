import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        "https://images.unsplash.com/photo-1662144374178-753a74fa28fb?q=80&fit=crop&w=1200&h=1200",
        height: 120,
        width: 120,
        fit: BoxFit.cover,
      ),
    );
  }
}
