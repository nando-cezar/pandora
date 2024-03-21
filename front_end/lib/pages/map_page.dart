import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controller/device_controller.dart';
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
  final DeviceController _controllerDevice = Get.put(DeviceController());
  final Completer<GoogleMapController> _controllerMap =
      Completer<GoogleMapController>();
  final CustomInfoWindowController _controllerInfoWindow =
      CustomInfoWindowController();
  final Map<String, Marker> _markers = {};

  @override
  void initState() {
    _getMarkerData();
    super.initState();
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
            onTap: (position) {
              _controllerInfoWindow.hideInfoWindow!();
            },
          ),
          CustomInfoWindow(
            controller: _controllerInfoWindow,
            height: 200,
            width: 300,
            offset: 35,
          ),
        ],
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
      infoWindow: _controllerDevice.index.value == 0
          ? InfoWindow(
              title: metaData['type'],
              snippet: metaData['address'],
            )
          : const InfoWindow(),
      onTap: () {
        _controllerDevice.index.value == 1 || _controllerDevice.index.value == 2
            ? _controllerInfoWindow.addInfoWindow!(
                Container(
                  height: 300,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 300,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(metaData['image']),
                            fit: BoxFit.fitWidth,
                            filterQuality: FilterQuality.high,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: Text(
                                metaData['type'],
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                            ),
                            const Spacer(),
                            const Text('*****')
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Text(
                          metaData['address'],
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                LatLng(
                  metaData['latitude'],
                  metaData['longitude'],
                ),
              )
            : ();
      },
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
    _controllerInfoWindow.googleMapController = controller;
  }
}
