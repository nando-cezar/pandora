import 'package:get/get.dart';

class ForecastTileController extends GetxController {
  RxString label = 'PR0'.obs;

  void changeLabel(String newLabel) {
    label.value = newLabel;
  }
}
