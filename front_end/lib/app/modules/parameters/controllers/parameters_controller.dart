import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pandora_front/app/controller/data_controller.dart';
import 'package:pandora_front/app/controller/position_controller.dart';
import 'package:pandora_front/app/modules/auth/controllers/auth_controller.dart';
import 'package:pandora_front/app/routes/app_pages.dart';

class ParamatersController extends GetxController {
  final AuthController authController;
  final PositionController positionController;
  final DataController dataController;
  final gMapController = Completer<GoogleMapController>();
  LatLng? _selectedLocation;
  final Set<Marker> _markers = {};

  ParamatersController({
    required this.authController,
    required this.positionController,
    required this.dataController,
  });

  getConfig() async {
    _setSelectedLocation(
      positionController.getLatitude(),
      positionController.getLongitude(),
    );
    _updateMarkers();
  }

  void persist() {
    Get.offAllNamed(Routes.dashboard);
  }

  void onMapTapped(LatLng location) {
    _selectedLocation = location;
    positionController.updateLatitude(location.latitude);
    positionController.updateLongitude(location.longitude);
    _updateMarkers();
  }

  void _updateMarkers() {
    _markers.clear();
    _markers.add(
      Marker(
        markerId: const MarkerId('selected_location'),
        position: _selectedLocation!,
      ),
    );
    update();
  }

  Set<Marker> getMarkers() => _markers;

  double getPastDaysSlider() => dataController.localDataRepository.getInt('pastDays').toDouble();

  setPastDaysSlider(double value) async {
    dataController.localDataRepository.saveInt('pastDays', value.toInt());
    update();
  }

  double getForecastDaysSlider() => dataController.localDataRepository.getInt('forecastDays').toDouble();

  void setForecastDaysSlider(double value) {
    dataController.localDataRepository.saveInt('forecastDays', value.toInt());
    update();
  }

  LatLng getSelectedLocation() {
    return _selectedLocation!;
  }

  void _setSelectedLocation(double latitude, double longitude) async {
    _selectedLocation = LatLng(latitude, longitude);
  }

  getInitialData() {
    setPastDaysSlider(dataController.getPastDays());
    setForecastDaysSlider(dataController.getForecastDays());
  }
}
