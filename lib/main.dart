import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketool_finance/app/home/controllers/home_controller.dart';
import 'package:marketool_finance/core/routes/app_pages.dart';
import 'package:marketool_finance/core/routes/app_routes.dart';
import 'package:marketool_finance/core/themes/app_dark_theme.dart';
import 'package:marketool_finance/core/themes/app_light_theme.dart';

void main() {
  Get.put(HomeController());
  runApp(MyApp());
}

class MyApp extends GetView<HomeController> {
  MyApp({super.key});
  final AppPages appPages = AppPages();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "MarkeTool Finance",
      theme: AppLightTheme.theme,
      darkTheme: AppDarkTheme.theme,
      themeMode: controller.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      getPages: appPages.routes,
      initialRoute: AppRoutes.login,
      debugShowCheckedModeBanner: false,
    );
  }
}
