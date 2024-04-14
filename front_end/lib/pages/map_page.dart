import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pandora_front/components/my_bottom_sheet.dart';

import '../constants.dart';
import '../controller/extreme_event_controller.dart';
import '../controller/position_controller.dart';
import '../model/location_model.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  bool _isInitialized = false;
  final _controllerPosition = Get.put(PositionController());
  final _controllerExtremeEvent = Get.put(ExtremeEventController());
  final _controllerMap = Completer<GoogleMapController>();
  final Map<String, Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    if (!_isInitialized) {
      _getMarkerData();
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            rotateGesturesEnabled: false,
            tiltGesturesEnabled: false,
            mapToolbarEnabled: false,
            compassEnabled: true,
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            initialCameraPosition: _getInitialCameraPosition(),
            onMapCreated: _onMapCreated,
            markers: Set<Marker>.of(_markers.values),
          ),
        ],
      ),
    );
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
        size: Size(40, 40),
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

  void _onMapCreated(GoogleMapController controller) {
    _controllerMap.complete(controller);
  }

  void _openBottomSheet(Map<String, dynamic> metaData, List<String> dataSource) {
    showModalBottomSheet(
      context: context,
      builder: (context) => MyBottomSheet(metaData: metaData, dataSource: dataSource),
    );
  }
}
