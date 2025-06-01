import 'package:flutter/material.dart';

class AppLightTheme {
  static ThemeData get theme {
    return ThemeData(
      // Modo de Cor do aplicativo:
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color.fromARGB(222, 255, 255, 255),
      primaryColor: const Color(0xFF2E7D32),

      // Estilo do AppBar:
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF2E7D32),
        foregroundColor: Colors.black,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: "Georgia",
          color: Colors.black
        ),
        centerTitle: true,
      ),

      // Estilo do Drawer:
      drawerTheme: DrawerThemeData(backgroundColor: Color(0xFF66BB6A)),

      // Estilos de texto:
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          fontFamily: "Georgia",
          color: Colors.black,
        ),

        bodyMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          fontFamily: "Georgia",
          color: Colors.black87,
        ),

        bodySmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w200,
          fontFamily: "Georgia",
          color: Colors.black87,
        ),
      ),

      // Estilo do Elevated Button:
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2E7D32),
          foregroundColor: Colors.white,
        ),
      ),

      // Esquema de cores do Modo Claro:
      colorScheme: ColorScheme.fromSwatch(brightness: Brightness.light)
          .copyWith(
            primary: const Color(0xFF2E7D32),
            secondary: const Color(0xFF66BB6A),
          ),

    );
  }
}
