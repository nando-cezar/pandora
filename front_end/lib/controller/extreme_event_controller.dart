import 'package:get/get.dart';

import '../model/extreme_event _model.dart';

class ExtremeEventController extends GetxController {
  final RxList<ExtremeEventModel> _items = <ExtremeEventModel>[].obs;

  void updateItems(List<ExtremeEventModel> items){
    _items.value = items;
  }

  RxList<ExtremeEventModel> getItems() => _items;

  ExtremeEventModel getItem(int i) => _items[i];
}
