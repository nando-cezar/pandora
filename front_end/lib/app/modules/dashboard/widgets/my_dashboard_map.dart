import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pandora_front/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:pandora_front/constants.dart';

class MyDashboardMap extends GetView<DashboardController> {
  const MyDashboardMap({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.mapController.loadMapStyle(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: myFirstColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 3,
                color: Colors.blue,
              ),
            ),
            child: _buildMap(snapshot.data!),
          );
        }
      },
    );
  }

  Widget _buildMap(String mapStyle) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GoogleMap(
          mapType: MapType.normal,
          myLocationEnabled: false,
          trafficEnabled: false,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          indoorViewEnabled: false,
          mapToolbarEnabled: false,
          style: mapStyle,
          initialCameraPosition: _getInitialCameraPosition(),
          onMapCreated: _onMapCreated,
          markers: controller.dataController.getMarkers(),
        ),
      ],
    );
  }

  CameraPosition _getInitialCameraPosition() {
    return CameraPosition(
      target: LatLng(
        controller.dataController.positionController.getLatitude(),
        controller.dataController.positionController.getLongitude(),
      ),
      zoom: 5,
    );
  }

  Future<void> _onMapCreated(GoogleMapController gController) async {
    controller.gMapController.complete(gController);
  }
}
