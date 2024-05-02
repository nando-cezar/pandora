import 'package:get/get.dart';
import 'package:pandora_front/app/data/model/user_model.dart';
import 'package:pandora_front/app/data/repository/auth_repository.dart';
import 'package:pandora_front/app/modules/auth/controllers/auth_controller.dart';
import 'package:pandora_front/app/ui/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsController extends GetxController {
  final repository = Get.put<AuthController>(
    AuthController(
      repository: AuthRepository(),
    ),
  );
  UserModel user = UserModel.mock();

  toggleTheme(val) {
    Provider.of<ThemeProvider>(Get.context!, listen: false).toggleTheme();
  }

  getUser() => _updateUser(repository.currentUser);

  _updateUser(UserModel value) {
    user = value;
    update();
  }
}
