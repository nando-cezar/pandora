import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pandora_front/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:pandora_front/app/ui/widgets/my_radiobutton.dart';
import 'package:pandora_front/constants.dart';

class MyDashboardMap extends GetView<DashboardController> {
  const MyDashboardMap({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getConfig(),
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
            child: _buildMap(snapshot.data as String),
          );
        }
      },
    );
  }

  Widget _buildMap(String mapStyle) {
    return GetBuilder<DashboardController>(builder: (controller) {
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
            markers: controller.getMarkers(),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: FloatingActionButton.small(
              onPressed: () => _buildDefaultDialog(controller),
              tooltip: 'change_map_view'.tr,
              backgroundColor: myFirstColor,
              child: const Icon(Icons.compare_arrows),
            ),
          ),
        ],
      );
    });
  }

  CameraPosition _getInitialCameraPosition() {
    return CameraPosition(
      target: LatLng(
        controller.dataController.localDataController.getLatitude(),
        controller.dataController.localDataController.getLongitude(),
      ),
      zoom: 5,
    );
  }

  Future<void> _onMapCreated(GoogleMapController gController) async {
    controller.gMapController.complete(gController);
  }

  void _buildDefaultDialog(DashboardController controller) {
    Get.defaultDialog(
      title: 'change_map_view'.tr,
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'select_region'.tr,
            style: TextStyle(
              color: Theme.of(Get.context!).colorScheme.tertiary,
            ),
          ),
          const SizedBox(height: 5),
          MyRadioButton(
            controller: controller.regionController,
            options: [
              'All'.tr,
              'North'.tr,
              'South'.tr,
              'Southeast'.tr,
              'East West'.tr,
              'Northeast'.tr,
              'Midwest'.tr,
            ],
            initialValue: controller.dataController.localDataController.getRegion().tr,
          ),
          const SizedBox(height: 10),
          Text(
            'select_event'.tr,
            style: TextStyle(
              color: Theme.of(Get.context!).colorScheme.tertiary,
            ),
          ),
          const SizedBox(height: 5),
          MyRadioButton(
            controller: controller.extremeEventController,
            options: [
              'Cold wave'.tr,
              'Flash flood'.tr,
              'Flood, General'.tr,
              'Heat wave'.tr,
              'Riverine flood'.tr,
              'Storm, General'.tr,
              'Extra-tropical storm'.tr,
            ],
            initialValue: controller.dataController.localDataController.getExtremeEvent().tr,
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text(
            'confirm'.tr,
            style: TextStyle(color: myFirstColor),
          ),
          onPressed: () {
            controller.dataController.localDataController.updateRegion(controller.regionController.text);
            controller.dataController.localDataController.updateExtremeEvent(controller.extremeEventController.text);
            controller.getMarkerData();
            Get.back(closeOverlays: true);
          },
        )
      ],
    );
  }
}
