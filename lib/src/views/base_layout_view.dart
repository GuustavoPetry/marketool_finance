import 'package:flutter/material.dart';
import 'package:marketool_financer/src/widgets/custom_app_bar.dart';
import 'package:marketool_financer/src/widgets/custom_app_drawer.dart';
import 'package:marketool_financer/src/widgets/custom_navigator_bar.dart';

class BaseLayoutView extends StatelessWidget {
  final String title;
  final Widget body;

  const BaseLayoutView({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomAppDrawer(),
      bottomNavigationBar: CustomNavigatorBar(),
      body: body,
      backgroundColor: const Color(0xFFD6D6D6),
    );
  }
}
