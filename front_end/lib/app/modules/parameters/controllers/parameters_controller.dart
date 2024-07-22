import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pandora_front/app/controller/data_controller.dart';
import 'package:pandora_front/app/modules/auth/controllers/auth_controller.dart';

class ParamatersController extends GetxController {
  final AuthController authController;
  final DataController dataController;
  final gMapController = Completer<GoogleMapController>();
  LatLng? _selectedLocation;
  final Set<Marker> _markers = {};

  ParamatersController({
    required this.authController,
    required this.dataController,
  });

  getConfig() async {
    _setSelectedLocation(
      dataController.localDataController.getLatitude(),
      dataController.localDataController.getLongitude(),
    );
    _updateMarkers();
  }

  void onMapTapped(LatLng location) {
    _selectedLocation = location;
    dataController.localDataController.updateLatitude(location.latitude);
    dataController.localDataController.updateLongitude(location.longitude);
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

  double getPastDaysSlider() =>
      dataController.localDataController.getPastDays().toDouble();

  setPastDaysSlider(double value) async {
    dataController.localDataController.updatePastDays(value.toInt());
    update();
  }

  double getForecastDaysSlider() =>
      dataController.localDataController.getForecastDays().toDouble();

  void setForecastDaysSlider(double value) {
    dataController.localDataController.updateForecastDays(value.toInt());
    update();
  }

  LatLng getSelectedLocation() {
    return _selectedLocation!;
  }

  void _setSelectedLocation(double latitude, double longitude) async {
    _selectedLocation = LatLng(latitude, longitude);
  }

  getInitialData() {
    setPastDaysSlider(
      dataController.localDataController.getPastDays().toDouble(),
    );
    setForecastDaysSlider(
      dataController.localDataController.getForecastDays().toDouble(),
    );
  }
}
