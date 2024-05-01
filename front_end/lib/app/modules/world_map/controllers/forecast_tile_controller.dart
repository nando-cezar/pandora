import 'package:get/get.dart';

class ForecastTileController extends GetxController {
  String _label = 'PA0';

  void updateLabel(String newLabel) {
    _label = newLabel;
  }

  String getLabel() => _label;
}
