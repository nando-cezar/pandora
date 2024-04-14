import 'package:get/get.dart';

class ForecastTileController extends GetxController {
  RxString label = ''.obs;

  void changeLabel(String newLabel) {
    label.value = newLabel;
  }
}
