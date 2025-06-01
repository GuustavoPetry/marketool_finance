import 'package:flutter/material.dart';

class AppDarkTheme {
  static ThemeData get theme {
    return ThemeData(
      // Modo de Cor do aplicativo:
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF000000),
      primaryColor: const Color(0xFF2E7D32),

      // Estilo do AppBar:
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1B5E20),
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          fontFamily: "Georgia",
          color: Colors.white
        ),
        centerTitle: true,
      ),

      // Estilo do Drawer:
      drawerTheme: const DrawerThemeData(backgroundColor: Color(0xFF2E7D32)),

      // Estilos de texto:
      textTheme: TextTheme(

        bodyLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          fontFamily: "Georgia",
          color: Colors.white,
        ),

        bodyMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          fontFamily: "Georgia",
          color: Colors.white
        ),

        bodySmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w200,
          fontFamily: "Georgia",
          color: Colors.white
        ),

      ),

      // Estilo do Elevated Button:
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2E7D32),
          foregroundColor: Colors.white,
        ),
      ),

      // Esquema de cores do Modo Escuro:
      colorScheme: ColorScheme.fromSwatch(brightness: Brightness.dark).copyWith(
        primary: const Color(0xFF2E7D32),
        secondary: const Color(0xFF66BB6A),
      ),
    );
  }
}
