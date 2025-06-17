import 'package:flutter/material.dart';
import 'package:marketool_financer/src/app/app_menu_items.dart';
import 'package:marketool_financer/src/views/base_layout_view.dart';

Map<String, WidgetBuilder> generateRoutes() {
  final Map<String, WidgetBuilder> routes = {};

  for (var item in appMenuItems) {
    routes[item.route] = (context) =>
        BaseLayoutView(title: item.title, body: item.page);
  }
  return routes;
}
