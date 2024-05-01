import 'package:get/get.dart';
import 'package:pandora_front/app/data/repository/auth_repository.dart';
import 'package:pandora_front/app/modules/register/controllers/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController(repository: AuthRepository()));
  }
}