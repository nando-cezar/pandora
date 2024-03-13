import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controller/position_controller.dart';

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

  _getMarkerData() async {
    final collectionRef = db
        .collection("Extreme Event")
        .doc("South America")
        .collection("Brazil");

    await collectionRef.get().then(
      (querySnapshot) {
        querySnapshot.docs
            .map((DocumentSnapshot doc) => {
                  'id': doc['id'],
                  'type': doc['type'],
                  'latitude': doc['location_data']['latitude'],
                  'longitude': doc['location_data']['longitude'],
                  'formatted': doc['location_data']['formatted']
                })
            .forEach((docSnapshot) {
          addMarker(docSnapshot);
        });
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  void addMarker(data) {
    var marker = Marker(
      markerId: MarkerId(data['id']),
      position: LatLng(
        double.parse(data['latitude']),
        double.parse(data['longitude']),
      ),
      infoWindow: InfoWindow(
        title: data['type'],
        snippet: data['formatted'],
      ),
    );

    setState(() {
      _markers[data['id']] = marker;
    });
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
