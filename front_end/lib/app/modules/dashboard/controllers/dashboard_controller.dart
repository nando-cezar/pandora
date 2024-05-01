import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pandora_front/app/controller/data_controller.dart';
import 'package:pandora_front/app/controller/map_controller.dart';

class DashboardController extends GetxController {
  final dataController = Get.find<DataController>();
  final mapController = Get.find<MapController>();
  final gMapController = Completer<GoogleMapController>();
}