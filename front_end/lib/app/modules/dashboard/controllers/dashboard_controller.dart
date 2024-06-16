import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pandora_front/app/controller/data_controller.dart';
import 'package:pandora_front/app/controller/map_controller.dart';
import 'package:pandora_front/app/data/model/location_model.dart';
import 'package:pandora_front/app/modules/dashboard/widgets/my_bottom_sheet.dart';
import 'package:pandora_front/constants.dart';

class DashboardController extends GetxController {
  final DataController dataController;
  final MapController mapController;
  final regionController = TextEditingController();
  final extremeEventController = TextEditingController();
  final gMapController = Completer<GoogleMapController>();

  final Map<String, Marker> _markers = {};

  DashboardController(
      {required this.dataController, required this.mapController});

  getConfig() async {
    await getMarkerData();
    return await mapController.loadMapStyle();
  }

  Future<void> getMarkerData({
    String extremeEventDescription = 'Flood, General',
    String region = 'All',
  }) async {
    _markers.clear();
    try {
      for (var locationSnapshot in dataController.getItems()) {
        if (locationSnapshot.description?.tr == extremeEventDescription.tr) {
          for (var locationDoc in locationSnapshot.locations!) {
            if (locationDoc.region?.tr == region.tr || region.tr == 'All'.tr) {
              _addMarker(locationDoc, locationSnapshot.dataSource!);
            }
          }
        }
      }
      update();
    } catch (e) {
      Get.snackbar(
        'error'.tr,
        e.toString(),
        icon: const Icon(Icons.cancel_outlined),
      );
    }
  }

  Future<void> _addMarker(LocationModel data, List<String> dataSource) async {
    var metaData = data.toJson();

    var markerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        size: Size(20, 20),
      ),
      metaData['icon'] as String,
    );

    var marker = Marker(
      icon: markerIcon,
      markerId: MarkerId(metaData['markerID'] as String),
      position: LatLng(
        metaData['latitude'] as double,
        metaData['longitude'] as double,
      ),
      onTap: () => _openBottomSheet(metaData, dataSource),
    );
    _markers[metaData['markerID'] as String] = marker;
  }

  Set<Marker> getMarkers() => Set<Marker>.of(_markers.values);

  void _openBottomSheet(
      Map<String, dynamic> metaData, List<String> dataSource) {
    Get.bottomSheet(
      MyBottomSheet(
        metaData: metaData,
        dataSource: dataSource,
      ),
      backgroundColor: mySeventhColor,
    );
  }
}
