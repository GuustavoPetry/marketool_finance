import 'package:flutter/material.dart';
import 'package:marketool_financer/src/app/generate_routes.dart';
import 'package:marketool_financer/src/services/auth_service.dart';
import 'package:marketool_financer/src/views/forgot_password_view.dart';
import 'package:marketool_financer/src/views/login_view.dart';
import 'package:marketool_financer/src/views/register_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MarkeTool Finance",
      initialRoute: AuthService.isLoggedIn ? "/home" : "/login",
      routes: {
        "/login": (context) => LoginView(),
        "/register": (context) => RegisterView(),
        "/forgot": (context) => ForgotPasswordView(),
        ...generateRoutes(),
      },
    );
  }
}
