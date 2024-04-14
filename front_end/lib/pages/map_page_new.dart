import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../components/my_bottom_sheet.dart';
import '../components/my_fab_menu_button.dart';
import '../components/my_selection_card.dart';
import '../constants.dart';
import '../controller/extreme_event_controller.dart';
import '../controller/forecast_tile_controller.dart';
import '../controller/position_controller.dart';
import '../model/location_model.dart';
import '../services/forecast_tile_service.dart';
import '../theme/theme_provider.dart';
import 'loading_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _controllerPosition = Get.put(PositionController());
  final _controllerExtremeEvent = Get.put(ExtremeEventController());
  final _controllerForecastTile = Get.put(ForecastTileController());
  final _controllerMap = Completer<GoogleMapController>();
  final Map<String, Marker> _markers = {};
  DateTime _forecastDate = DateTime.now();
  TileOverlay? _tileOverlay;
  late Future<String> _mapStyleFuture;

  @override
  void initState() {
    super.initState();
    _mapStyleFuture = _loadMapStyle();
    _getMarkerData();
    ever(_controllerForecastTile.label, (_) {
      _initTiles(_forecastDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _mapStyleFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingPage();
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Scaffold(
            body: _buildMap(snapshot.data!),
            floatingActionButton: const MyFabMenuButton(),
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
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          mapType: MapType.normal,
          style: mapStyle,
          initialCameraPosition: _getInitialCameraPosition(),
          onMapCreated: _onMapCreated,
          tileOverlays:
              _tileOverlay == null ? {} : <TileOverlay>{_tileOverlay!},
          markers: Set<Marker>.of(_markers.values),
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

  Future<String> _loadMapStyle() async {
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    String value = await DefaultAssetBundle.of(context).loadString(themeProvider.getMapStyle());
    return value;
  }

  _initTiles(DateTime date) async {
    final String overlayId = date.millisecondsSinceEpoch.toString();

    final TileOverlay tileOverlay = TileOverlay(
      tileOverlayId: TileOverlayId(overlayId),
      tileProvider: ForecastTileProvider(
        dateTime: date,
        mapType: _controllerForecastTile.label.value,
        opacity: 0.4,
      ),
    );
    setState(() {
      _tileOverlay = tileOverlay;
    });
  }

  _getMarkerData() async {
    try {
      for (var locationSnapshot in _controllerExtremeEvent.items) {
        for (var locationDoc in locationSnapshot.locations) {
          addMarker(locationDoc, locationSnapshot.dataSource);
        }
      }
    } catch (e) {
      myShowDialog(context, "Error completing: $e");
    }
    return _markers;
  }

  void addMarker(LocationModel data, List<String> dataSource) async {
    var metaData = data.toFirestore();

    var markerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        size: Size(20, 20),
      ),
      metaData['icon'],
    );

    var marker = Marker(
      icon: markerIcon,
      markerId: MarkerId(metaData['markerID']),
      position: LatLng(
        metaData['latitude'],
        metaData['longitude'],
      ),
      onTap: () => _openBottomSheet(metaData, dataSource),
    );

    _markers[metaData['markerID']] = marker;
    setState(() {});
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

  void _openBottomSheet(Map<String, dynamic> metaData, List<String> dataSource) {
    showModalBottomSheet(
      context: context,
      builder: (context) => MyBottomSheet(metaData: metaData, dataSource: dataSource),
    );
  }
}
