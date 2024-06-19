import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/data/model/user_model.dart';
import 'package:pandora_front/app/modules/auth/controllers/auth_controller.dart';
import 'package:pandora_front/app/ui/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsController extends GetxController {
  UserModel user = UserModel.mock();
  final AuthController authController;
  final localeController = TextEditingController();

  SettingsController({required this.authController});

  @override
  void onInit() {
    super.onInit();
    user = authController.currentUser;
  }

  toggleTheme(val) {
    Provider.of<ThemeProvider>(Get.context!, listen: false).toggleTheme();
  }

  Locale getLocale() {
    if (localeController.text == 'Portuguese - BR') {
      return const Locale('pt', 'BR');
    } else {
      return const Locale('en', 'US');
    }
  }
}
