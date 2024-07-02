import 'package:get/get.dart';
import 'package:pandora_front/app/data/repository/auth_repository.dart';
import 'package:pandora_front/app/modules/login/controllers/login_controller.dart';

class LoginBinding implements Bindings {
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
    Get.lazyPut<LoginController>(
      () => LoginController(
        repository: Get.find<AuthRepository>(),
      ),
    );
  }
}
