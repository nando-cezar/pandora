import 'package:get/get.dart';
import 'package:pandora_front/app/modules/settings/controllers/settings_controller.dart';


class SettingsMiddleware extends GetMiddleware {

  @override
  GetPage? onPageCalled(GetPage? page) {
    final controller = Get.put(SettingsController());
    controller.getUser();
    return page;
  }

}