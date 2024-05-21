import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pandora_front/app/controller/position_controller.dart';
import 'package:pandora_front/app/data/model/extreme_event_model.dart';
import 'package:pandora_front/app/data/model/location_model.dart';
import 'package:pandora_front/app/data/repository/data_repository.dart';
import 'package:pandora_front/app/data/repository/position_repository.dart';
import 'package:pandora_front/app/modules/dashboard/widgets/my_bottom_sheet.dart';

class DataController extends GetxController {
  List<ExtremeEventModel> _items = <ExtremeEventModel>[];
  int _pastDays = 4;
  int _forecastDays = 5;
  final Map<String, Marker> _markers = {};

  final positionController = Get.put(
    PositionController(
      positionRepository: PositionRepository(),
    ),
  );

  final DataRepository dataRepository;

  DataController({required this.dataRepository});

  Future<void> getGeneralData() async {
    await positionController.getLocationData();
    await dataRepository
        .getGeneralData(
      latitude: positionController.getLatitude(),
      longitude: positionController.getLongitude(),
      pastDays: _pastDays,
      forecastDays: _forecastDays,
    )
        .then((value) async {
      updateItems(value.events);
      await _getMarkerData();
      Get.snackbar(
        'success'.tr,
        'success_message'.tr,
        icon: const Icon(Icons.check),
      );
    }).catchError((e) {
      Get.snackbar(
        'error'.tr,
        e.toString(),
        icon: const Icon(Icons.cancel_outlined),
      );
    });
  }

  Future<void> _getMarkerData() async {
    try {
      for (var locationSnapshot in getItems()) {
        if(locationSnapshot.code == 5){
          for (var locationDoc in locationSnapshot.locations!) {
            if(locationDoc.region == 'Southeast'){
              _addMarker(locationDoc, locationSnapshot.dataSource!);
            }
          }
        }
      }
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

  void _openBottomSheet(
      Map<String, dynamic> metaData, List<String> dataSource) {
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) =>
          MyBottomSheet(metaData: metaData, dataSource: dataSource),
    );
  }

  updatePastDays(int pastDays){
    _pastDays = pastDays;
  }

  updateForecastDays(int forecastDays){
    _forecastDays = forecastDays;
  }

  updateItems(List<ExtremeEventModel> items) => _items = items;

  double getPastDays() => _pastDays.toDouble();

  double getForecastDays() => _forecastDays.toDouble();

  List<ExtremeEventModel> getItems() => _items;

  ExtremeEventModel getItem(int i) => _items[i];

  Set<Marker> getMarkers() => Set<Marker>.of(_markers.values);
}
