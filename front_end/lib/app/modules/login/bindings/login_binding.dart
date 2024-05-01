import 'package:get/get.dart';
import 'package:pandora_front/app/data/repository/auth_repository.dart';
import 'package:pandora_front/app/modules/login/controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(repository: AuthRepository()));
  }
}