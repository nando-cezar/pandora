import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pandora_front/app/controller/position_controller.dart';
import 'package:pandora_front/app/data/repository/position_repository.dart';
import 'package:pandora_front/app/routes/app_pages.dart';

class ParamatersController extends GetxController {
  final positionController = Get.put(
    PositionController(
      positionRepository: PositionRepository(),
    ),
  );
  final gMapController = Completer<GoogleMapController>();
  final Set<Marker> _markers = {};
  LatLng? _selectedLocation;
  double _pastDaysSlider = 2;
  double _forecastDaysSlider = 8;

  getConfig() async {
    await positionController.getLocationData();
    _setSelectedLocation(
      positionController.getLatitude(),
      positionController.getLongitude(),
    );
    _updateMarkers();
  }

  void persist() {
    positionController.updateLatLng(
      _selectedLocation!.latitude,
      _selectedLocation!.longitude,
    );
    Get.offAllNamed(Routes.dashboard);
  }

  void onMapTapped(LatLng location) {
    _selectedLocation = location;
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

  double getPastDaysSlider() => _pastDaysSlider;

  void setPastDaysSlider(double value) {
    _pastDaysSlider = value;
    update();
  }

  double getForecastDaysSlider() => _forecastDaysSlider;

  void setForecastDaysSlider(double value) {
    _forecastDaysSlider = value;
    update();
  }

  LatLng getSelectedLocation() {
    return _selectedLocation!;
  }

  void _setSelectedLocation(double latitude, double longitude) async {
    _selectedLocation = LatLng(latitude, longitude);
  }
}
