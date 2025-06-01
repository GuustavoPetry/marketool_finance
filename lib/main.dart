import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketool_finance/app/_core/controllers/theme_controller.dart';
import 'package:marketool_finance/app/_core/my_app.dart';

void main() {
  Get.put(ThemeController());
  runApp(MyApp());
}


