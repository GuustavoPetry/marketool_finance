import 'package:flutter/widgets.dart';

class MenuModel {
  final String title;
  final IconData icon;
  final String route;
  final Widget page;

  MenuModel({
    required this.title,
    required this.icon,
    required this.route,
    required this.page
  });
}