import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../components/my_selection_card.dart';
import '../controller/position_controller.dart';
import '../services/forecast_tile_service.dart';
import '../theme/theme_provider.dart';
import 'loading_page.dart';

class MapPageNew extends StatefulWidget {
  const MapPageNew({super.key});

  @override
  State<MapPageNew> createState() => _MapPageState();
}

class _MapPageState extends State<MapPageNew> {
  final _controllerPosition = Get.put(PositionController());
  final  _controllerMap = Completer<GoogleMapController>();
  DateTime _forecastDate = DateTime.now();
  TileOverlay? _tileOverlay;

  Future<String> _loadMapStyle() async {
    String value = await DefaultAssetBundle.of(context).loadString(
        Provider.of<ThemeProvider>(context, listen: false).getMapStyle());
    return value;
  }

  _initTiles(DateTime date) async {
    final String overlayId = date.millisecondsSinceEpoch.toString();

    final TileOverlay tileOverlay = TileOverlay(
      tileOverlayId: TileOverlayId(overlayId),
      tileProvider: ForecastTileProvider(
        dateTime: date,
        mapType: 'PR0',
        opacity: 0.4,
      ),
    );
    setState(() {
      _tileOverlay = tileOverlay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _loadMapStyle(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return _buildMap(snapshot.data!);
          }
        },
      ),
    );
  }

  Widget _buildMap(String mapStyle) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GoogleMap(
          mapType: MapType.normal,
          style: mapStyle,
          initialCameraPosition: _getInitialCameraPosition(),
          onMapCreated: _onMapCreated,
          tileOverlays:
              _tileOverlay == null ? {} : <TileOverlay>{_tileOverlay!},
        ),
        MySelectionCard(
          onTapLeft: tapLeft,
          onTapRight: tapRight,
          text:
              'Forecast Date:\n${DateFormat('yyyy-MM-dd ha').format(_forecastDate)}',
        ),
      ],
    );
  }

  tapRight() {
    setState(() {
      _forecastDate = _forecastDate.add(const Duration(hours: 3));
    });
    _initTiles(_forecastDate);
  }

  tapLeft() {
    setState(() {
      _forecastDate = _forecastDate.subtract(const Duration(hours: 3));
    });
    _initTiles(_forecastDate);
  }

  CameraPosition _getInitialCameraPosition() {
    return CameraPosition(
      target: LatLng(
        _controllerPosition.latitude.value,
        _controllerPosition.longitude.value,
      ),
      zoom: 5,
    );
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _controllerMap.complete(controller);
    _initTiles(_forecastDate);
  }
}
