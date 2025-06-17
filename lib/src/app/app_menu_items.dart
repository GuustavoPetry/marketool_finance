import 'package:flutter/material.dart';
import 'package:marketool_financer/src/models/menu_model.dart';
import 'package:marketool_financer/src/views/home_view.dart';
import 'package:marketool_financer/src/views/upload_view.dart';


final List<MenuModel> appMenuItems = [
  MenuModel(
    title: "Home", 
    icon: Icons.home, 
    route: "/home", 
    page: const HomeView()
  ),
  MenuModel(
    title: "Importar Notas", 
    icon: Icons.file_upload_sharp, 
    route: "/upload", 
    page: const UploadView()
  )
];