import 'package:marketool_finance/app/_core/controllers/theme_controller.dart';
import 'package:marketool_finance/app/_core/widgets/bottom_app_bar.dart';
import 'package:marketool_finance/app/_core/widgets/custom_drawer.dart';
import 'package:marketool_finance/app/_core/widgets/top_app_bar.dart';
import 'package:marketool_finance/app/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(),

      drawer: CustomDrawer(),

      body: _body(),

      bottomNavigationBar: CustomBottomAppBar()
    );
  }
}

Widget _body() {
  return ListView();
}
