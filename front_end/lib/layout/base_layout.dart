import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../components/my_drawer.dart';
import '../components/my_navbar.dart';
import '../constants.dart';
import '../controller/extreme_event_controller.dart';
import '../controller/pages_controller.dart';
import '../controller/position_controller.dart';
import '../model/extreme_event_wrapper.dart';
import '../pages/loading_page.dart';
import '../services/extreme_event_service.dart';
import '../services/position_service.dart';

class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key});

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  static String apiPandoraKey = dotenv.env['API_PANDORA_KEY']!;
  final _controllerPages = Get.put(PagesController());
  final _controllerPosition = Get.put(PositionController());
  final _controllerExtremeEvent = Get.put(ExtremeEventController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ExtremeEventWrapper>(
      future: _fetchPositionAndEventData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingPage();
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.events.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          _controllerExtremeEvent.updateItems(snapshot.data!.events);
          return Scaffold(
            appBar: myAppBar(),
            drawer: MyDrawer(),
            body:
            Obx(() => _controllerPages.getPage(_controllerPages.getIndex())),
            bottomNavigationBar: Obx(
                  () => MyNavBar(
                value: _controllerPages.getIndex(),
              ),
            ),
          );
        }
      },
    );
  }

  Future<ExtremeEventWrapper> _fetchPositionAndEventData() async {
    if (_controllerPosition.getLatitude() == 0.0 &&
        _controllerPosition.getLongitude() == 0.0) {
      final Position position = await PositionService.getPosition();
      _controllerPosition.updateLatLng(position.latitude, position.longitude);
    }

    final ExtremeEventWrapper extremeEvent =
        await ExtremeEventService.getGeneralData(
      _controllerPosition.getLatitude(),
      _controllerPosition.getLatitude(),
      3,
      5,
      apiPandoraKey,
    );

    return extremeEvent;
  }
}
