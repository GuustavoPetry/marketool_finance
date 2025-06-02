import 'package:get/get.dart';
import 'package:marketool_finance/app/auth/controllers/login_binding.dart';
import 'package:marketool_finance/app/auth/pages/login_page.dart';
import 'package:marketool_finance/app/home/controllers/home_binding.dart';
import 'package:marketool_finance/app/home/pages/home_page.dart';
import 'package:marketool_finance/app/_core/routes/app_routes.dart';
import 'package:marketool_finance/app/auth/pages/register_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
    ),
  ];
}