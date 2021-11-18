import 'package:ecommerce/core/controllers/auth_controller.dart';
import 'package:ecommerce/core/controllers/home_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomeController());
  }
}
