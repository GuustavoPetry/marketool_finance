import 'package:flutter/material.dart';
import 'package:marketool_financer/src/models/menu_model.dart';
import 'package:marketool_financer/src/views/help_center_view.dart';
import 'package:marketool_financer/src/views/home_view.dart';
import 'package:marketool_financer/src/views/patrimony_view.dart';
import 'package:marketool_financer/src/views/upload_view.dart';

final List<MenuModel> appMenuItems = [
  MenuModel(
    title: "Home",
    icon: Icons.home,
    route: "/home",
    page: const HomeView(),
  ),
  MenuModel(
    title: "Meu Patrimônio",
    icon: Icons.money,
    route: "/patrimony",
    page: const PatrimonyView(),
  ),
  MenuModel(
    title: "Importar Notas",
    icon: Icons.file_upload_sharp,
    route: "/upload",
    page: const UploadView(),
  ),
  MenuModel(
    title: "Central de Ajuda",
    icon: Icons.help_center,
    route: "/help",
    page: const HelpCenterView(),
  ),
];
