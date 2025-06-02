import 'package:marketool_finance/app/_core/controllers/theme_controller.dart';
import 'package:marketool_finance/app/_core/routes/app_pages.dart';
import 'package:marketool_finance/app/_core/routes/app_routes.dart';
import 'package:marketool_finance/app/_core/themes/app_dark_theme.dart';
import 'package:marketool_finance/app/_core/themes/app_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends GetView<ThemeController> {
 const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "MarkeTool Finance",
      theme: AppLightTheme.theme,
      darkTheme: AppDarkTheme.theme,
      themeMode: controller.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      getPages: AppPages.routes, 
      initialRoute: AppRoutes.login,
      debugShowCheckedModeBanner: false,
    );
  }
}