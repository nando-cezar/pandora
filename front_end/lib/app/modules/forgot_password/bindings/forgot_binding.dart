import 'package:get/get.dart';
import 'package:pandora_front/app/data/repository/auth_repository.dart';
import 'package:pandora_front/app/modules/forgot_password/controllers/forgot_controller.dart';

class ForgotPasswordBinding implements Bindings {
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
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(
        repository: Get.find<AuthRepository>(),
      ),
    );
  }
}
