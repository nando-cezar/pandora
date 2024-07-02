import 'package:get/get.dart';
import 'package:pandora_front/app/data/repository/auth_repository.dart';
import 'package:pandora_front/app/modules/register/controllers/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    _registerRepositories();
    _registerControllers();
  }

  void _registerRepositories() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepository(),
    );
  }

  void _registerControllers() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(
        repository: Get.find<AuthRepository>(),
      ),
    );
  }
}
