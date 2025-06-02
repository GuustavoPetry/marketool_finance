import 'package:get/get.dart';
import 'package:marketool_finance/app/upload/controllers/upload_controller.dart';

class UploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadController());
  }
}
