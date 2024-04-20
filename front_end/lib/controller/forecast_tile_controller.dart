import 'package:get/get.dart';

class ForecastTileController extends GetxController {
  final RxString _label = ''.obs;

  void updateLabel(String label) {
    _label.value = label;
  }

  RxString getRxLabel() => _label;

  String getLabel() => _label.value;
}
