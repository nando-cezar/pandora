import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../components/my_textfield.dart';
import '../constants.dart';
import '../controller/position_controller.dart';

class ChangeParametersPage extends StatefulWidget {
  const ChangeParametersPage({super.key});

  @override
  State<ChangeParametersPage> createState() => _ChangeParametersPageState();
}

class _ChangeParametersPageState extends State<ChangeParametersPage> {
  final _controllerPosition = Get.put(PositionController());
  final _controllerMap = Completer<GoogleMapController>();
  var latitudeController = TextEditingController();
  var longitudeController = TextEditingController();
  LatLng? _selectedLocation;
  double _pastDaysSlider = 1;
  double _forecastDaysSlider = 5;

  //final Set<Marker> _markers = {};

  @override
  void initState() {
    latitudeController.text = _controllerPosition.latitude.value.toString();
    longitudeController.text = _controllerPosition.longitude.value.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(actions: [
        IconButton(
          icon: const Icon(Icons.check),
          onPressed: () {},
        ),
      ]),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Change Parameters',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: myFirstColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Latitude',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                          const SizedBox(height: 10),
                          MyTextField(
                            controller: latitudeController,
                            hintText: 'Latitude',
                            obscureText: false,
                            enabled: false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Longitude',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                          const SizedBox(height: 10),
                          MyTextField(
                            controller: longitudeController,
                            hintText: 'Longitude',
                            obscureText: false,
                            enabled: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _getInitialCameraPosition(),
                    onMapCreated: _onMapCreated,
                    onTap: _onMapTapped,
                    //markers: _markers,
                  ),
                ),
                Divider(
                  height: 20,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(height: 20),
                Text(
                  'Monitoring',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Past days',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                Slider(
                  activeColor: myFirstColor,
                  value: _pastDaysSlider,
                  min: 1,
                  max: 5,
                  divisions: 5,
                  label: _pastDaysSlider.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _pastDaysSlider = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  'Forecast days',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                Slider(
                  activeColor: myFirstColor,
                  value: _forecastDaysSlider,
                  min: 1,
                  max: 14,
                  divisions: 14,
                  label: _forecastDaysSlider.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _forecastDaysSlider = value;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
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
  }

  void _onMapTapped(LatLng location) {
    setState(() {
      _selectedLocation = location;
      latitudeController.text = _selectedLocation!.latitude.toString();
      longitudeController.text = _selectedLocation!.latitude.toString();
    });

    //_updateMarkers();
  }

/*void _updateMarkers() {
    setState(() {
      _markers.clear();
      if (_selectedLocation != null) {
        _markers.add(
          Marker(
            markerId: const MarkerId('selected_location'),
            position: _selectedLocation!,
          ),
        );
      }
    });
  }*/
}
