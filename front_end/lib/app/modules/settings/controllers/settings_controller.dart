import 'package:get/get.dart';
import 'package:pandora_front/app/data/model/user_model.dart';
import 'package:pandora_front/app/data/repository/auth_repository.dart';
import 'package:pandora_front/app/modules/auth/controllers/auth_controller.dart';
import 'package:pandora_front/app/ui/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsController extends GetxController {
  final authController = Get.put(
    AuthController(
      repository: AuthRepository(),
    ),
  );

  UserModel user = UserModel.mock();

  @override
  void onInit() {
    _getUser();
    super.onInit();
  }

  toggleTheme(val) {
    Provider.of<ThemeProvider>(Get.context!, listen: false).toggleTheme();
  }

  _getUser() => _updateUser(authController.currentUser);

  _updateUser(UserModel value) {
    user = value;
    update();
  }
}
