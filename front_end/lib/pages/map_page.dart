import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controller/position_controller.dart';
import '../model/marker_model.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final PositionController _controllerPosition = Get.put(PositionController());
  final Completer<GoogleMapController> _controllerMap =
      Completer<GoogleMapController>();
  final Map<String, Marker> _markers = {};

  @override
  void initState() {
    _getMarkerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _getInitialCameraPosition(),
        onMapCreated: _onMapCreated,
        markers: Set<Marker>.of(_markers.values),
      ),
    );
  }

  Future<Map<String, Marker>> _getMarkerData() async {
    try {
      final collectionRef = db
          .collection("Extreme Event")
          .doc("South America")
          .collection("Brazil");

      final querySnapshot = await collectionRef.get();
      for (var docSnapshot in querySnapshot.docs) {
        final locationDataRef =
            collectionRef.doc(docSnapshot.id).collection("Location Data");
        final locationSnapshot = await locationDataRef.get();
        for (var locationDoc in locationSnapshot.docs) {
          addMarker(MarkerModel.fromFirestore(docSnapshot.id, locationDoc));
        }
      }
    } catch (e) {
      print("Error completing: $e");
    }
    return _markers;
  }

  void addMarker(MarkerModel data) async {
    var metaData = data.toFirestore();

    var markerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        size: Size(40, 40),
      ),
      metaData['icon'],
    );

    var marker = Marker(
      icon: markerIcon,
      markerId: MarkerId(metaData['id']),
      position: LatLng(
        metaData['latitude'],
        metaData['longitude'],
      ),
      infoWindow: InfoWindow(
        title: metaData['type'],
        snippet: metaData['address'],
      ),
    );

    _markers[metaData['id']] = marker;
    setState(() {});
  }

  CameraPosition _getInitialCameraPosition() {
    return CameraPosition(
      target: LatLng(
        _controllerPosition.latitude.value,
        _controllerPosition.longitude.value,
      ),
      zoom: 15,
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controllerMap.complete(controller);
  }
}
