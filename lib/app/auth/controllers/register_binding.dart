import 'package:get/get.dart';
import 'package:marketool_finance/app/auth/controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}

/* Esse arquivo serve para ligar o controlador à tela de Registro, de forma automática e organizada.
Assim, sempre que chamar a rota de Registro, o controlador estará disponível para gerenciar o estado dos widgets */