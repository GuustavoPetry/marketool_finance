import 'package:flutter/material.dart';
import 'package:marketool_financer/src/providers/tutorial_keys_provider.dart';
import 'package:provider/provider.dart';
import 'package:marketool_financer/src/app/app_widget.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TutorialKeysProvider()),
      ],
      child: const AppWidget(),
    ),
  );
}
