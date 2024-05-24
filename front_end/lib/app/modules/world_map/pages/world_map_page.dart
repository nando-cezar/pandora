import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pandora_front/app/modules/world_map/controllers/world_map_controller.dart';
import 'package:pandora_front/app/modules/world_map/widgets/my_fab_menu_button.dart';
import 'package:pandora_front/app/modules/world_map/widgets/my_selection_card.dart';
import 'package:pandora_front/app/ui/pages/message_page.dart';
import 'package:pandora_front/app/ui/widgets/my_drawer.dart';
import 'package:pandora_front/constants.dart';

class WorldMapPage extends GetView<WorldMapController> {
  const WorldMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getConfig(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MessagePage(message: 'preparing_data'.tr);
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Scaffold(
            appBar: myAppBar(),
            drawer: const MyDrawer(),
            body: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors.blue,
                ),
              ),
              child: _buildMap(snapshot.data as String),
            ),
            floatingActionButton: const MyFabMenuButton(),
          );
        }
      },
    );
  }

  Widget _buildMap(String mapStyle) {
    return GetBuilder<WorldMapController>(builder: (controller) {
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
            style: mapStyle,
            initialCameraPosition: _getInitialCameraPosition(),
            onMapCreated: _onMapCreated,
            tileOverlays: <TileOverlay>{controller.tileOverlay},
          ),
          MySelectionCard(
            onTapLeft: () => controller.tapLeft(),
            onTapRight: () => controller.tapRight(),
            text:
                '${'forecast_date'.tr}:\n${DateFormat('yyyy-MM-dd ha').format(controller.forecastDate)}',
          ),
        ],
      );
    });
  }

  CameraPosition _getInitialCameraPosition() {
    return CameraPosition(
      target: LatLng(
        controller.positionController.getLatitude(),
        controller.positionController.getLongitude(),
      ),
      zoom: 5,
    );
  }

  Future<void> _onMapCreated(GoogleMapController gController) async {
    controller.gMapController.complete(gController);
  }
}
