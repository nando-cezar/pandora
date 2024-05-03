import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pandora_front/app/modules/parameters/controllers/parameters_controller.dart';
import 'package:pandora_front/app/ui/pages/message_page.dart';
import 'package:pandora_front/constants.dart';

class ParametersPage extends GetView<ParamatersController> {
  const ParametersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getConfig(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MessagePage(message: 'preparing_data'.tr);
        } else if (snapshot.hasError) {
          return MessagePage(
            message: 'error_message'.tr,
          );
        } else {
          return Scaffold(
            appBar: myAppBar(actions: [
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: () => controller.persist(),
              ),
            ]),
            body: GetBuilder<ParamatersController>(
              builder: (controller) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'change_parameters'.tr,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: myFirstColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'location'.tr,
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
                                    'Latitude: ${controller.getSelectedLocation().latitude}',
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.tertiary,
                                    ),
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
                                    'Longitude: ${controller.getSelectedLocation().longitude}',
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.tertiary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: Get.width,
                          height: Get.height * 0.5,
                          child: GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: _getInitialCameraPosition(),
                            onMapCreated: _onMapCreated,
                            onTap: controller.onMapTapped,
                            markers: controller.getMarkers(),
                          ),
                        ),
                        Divider(
                          height: 20,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'monitoring'.tr,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'past_days'.tr,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        Slider(
                          activeColor: myFirstColor,
                          value: controller.getPastDaysSlider(),
                          min: 1,
                          max: 5,
                          divisions: 5,
                          label: controller.getPastDaysSlider().round().toString(),
                          onChanged: (value) => controller.setPastDaysSlider(value),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'forecast_days'.tr,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        Slider(
                          activeColor: myFirstColor,
                          value: controller.getForecastDaysSlider(),
                          min: 1,
                          max: 14,
                          divisions: 14,
                          label:
                          controller.getForecastDaysSlider().round().toString(),
                          onChanged: (value) => controller.setForecastDaysSlider(value),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );

  }

  CameraPosition _getInitialCameraPosition() {
    return CameraPosition(
      target: controller.getSelectedLocation(),
      zoom: 5,
    );
  }

  Future<void> _onMapCreated(GoogleMapController gController) async {
    controller.gMapController.complete(gController);
  }
}
