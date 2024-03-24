import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../components/my_drawer.dart';
import '../components/my_navbar.dart';
import '../constants.dart';
import '../controller/extreme_event_controller.dart';
import '../controller/pages_controller.dart';
import '../controller/position_controller.dart';
import '../model/extreme_event_wrapper.dart';
import '../services/extreme_event_service.dart';
import '../services/position_service.dart';

class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key});

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  static String API_PANDORA_KEY = dotenv.env['API_PANDORA_KEY']!;
  final PagesController _controllerPages = Get.put(PagesController());
  final PositionController _controllerPosition = Get.put(PositionController());
  final ExtremeEventController _controllerExtremeEvent = Get.put(ExtremeEventController());

  Future<ExtremeEventWrapper> _fetchPositionAndEventData() async {
    final Position position = await PositionService.getPosition();
    _controllerPosition.latitude.value = position.latitude;
    _controllerPosition.longitude.value = position.longitude;

    final ExtremeEventWrapper extremeEvent =
    await ExtremeEventService.getGeneralData(
        position.latitude,
        position.longitude,
        API_PANDORA_KEY
    );

    return extremeEvent;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ExtremeEventWrapper>(
      future: _fetchPositionAndEventData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Lottie.asset('assets/images/loading.json'));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.events.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          _controllerExtremeEvent.items.value = snapshot.data!.events;
          return Scaffold(
            appBar: myAppBar,
            drawer: MyDrawer(),
            body: Obx(() => _controllerPages.pages[_controllerPages.index.value]),
            bottomNavigationBar: Obx(
                  () => MyNavBar(
                value: _controllerPages.index.value,
              ),
            ),
          );
        }
      },
    );
  }
}
