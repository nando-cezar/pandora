import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pandora_front/app/controller/map_controller.dart';
import 'package:pandora_front/app/controller/position_controller.dart';
import 'package:pandora_front/app/data/repository/forecast_tile_repository.dart';
import 'package:pandora_front/app/modules/world_map/controllers/forecast_tile_controller.dart';
import 'package:uuid/uuid.dart';

class WorldMapController extends GetxController {
  final ForecastTileRepository repository;
  final MapController mapController;
  final PositionController positionController;
  final ForecastTileController forecastTileController;
  final gMapController = Completer<GoogleMapController>();
  var forecastDate = DateTime.now();
  var tileOverlay = TileOverlay(
    tileOverlayId: TileOverlayId(
      const Uuid().v4(),
    ),
  );

  WorldMapController({
    required this.repository,
    required this.mapController,
    required this.positionController,
    required this.forecastTileController,
  });

  getConfig() async {
    await positionController.getLocationData();
    return await mapController.loadMapStyle();
  }

  tapLeft() {
    forecastDate = forecastDate.subtract(const Duration(hours: 3));
    initTiles();
  }

  tapRight() {
    forecastDate = forecastDate.add(const Duration(hours: 3));
    initTiles();
  }

  initTiles() async {
    final String overlayId = const Uuid().v4();

    final TileOverlay tile = TileOverlay(
      tileOverlayId: TileOverlayId(overlayId),
      tileProvider: repository.getForecastTileProvider(
        mapType: forecastTileController.getLabel(),
        opacity: 0.4,
        dateTime: forecastDate,
      ),
    );
    tileOverlay = tile;
    update();
  }
}
