import 'package:get/get.dart';
import 'package:marketool_finance/app/auth/controllers/login_binding.dart';
import 'package:marketool_finance/app/auth/controllers/register_binding.dart';
import 'package:marketool_finance/app/auth/pages/login_page.dart';
import 'package:marketool_finance/app/home/controllers/home_binding.dart';
import 'package:marketool_finance/app/home/pages/home_page.dart';
import 'package:marketool_finance/app/_core/routes/app_routes.dart';
import 'package:marketool_finance/app/auth/pages/register_page.dart';
import 'package:marketool_finance/app/upload/controllers/upload_binding.dart';
import 'package:marketool_finance/app/upload/pages/upload_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding()
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding()
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterPage(),
      binding: RegisterBinding()
    ),
    GetPage(
      name: AppRoutes.upload, 
      page: () => UploadPage(),
      binding: UploadBinding()
      )
  ];
}