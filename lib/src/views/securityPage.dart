import 'package:flutter/material.dart';
import 'package:marketool_financer/src/widgets/custom_app_bar.dart';


class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomAppBar(),
    );
  }
}