import 'package:get/get.dart';

import '../state/device_state.dart';

class DeviceController extends GetxController {
  Rx<DeviceState> state = DeviceState.desktop.obs;

  void changeState(DeviceState newState) {
    state.value = newState;
  }
}
