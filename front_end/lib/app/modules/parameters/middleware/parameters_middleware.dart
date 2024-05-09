import 'package:get/get.dart';
import 'package:pandora_front/app/modules/parameters/controllers/parameters_controller.dart';

class ParametersMiddleware extends GetMiddleware {

  @override
  GetPage? onPageCalled(GetPage? page) {
    final controller = Get.put(ParamatersController());
    controller.getInitialData();
    return page;
  }

}