import 'package:get/get.dart';
import 'package:marketool_finance/app/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

/* Esse arquivo serve para ligar o controlador à tela de login, de forma automática e organizada.
Assim, sempre que você abrir a tela de login, o controlador estará disponível para gerenciar os campos e ações dessa tela. */
