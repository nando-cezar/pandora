import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../components/my_drawer.dart';
import '../components/my_navbar.dart';
import '../constants.dart';
import '../controller/pages_controller.dart';
import '../controller/position_controller.dart';
import '../services/position_service.dart';

class BaseLayout extends StatefulWidget {

  const BaseLayout({super.key});

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  final PagesController _controllerPages = Get.put(PagesController());
  final PositionController _controllerPosition = Get.put(PositionController());

  _fetchPosition() async {
    final Position position = await PositionService.getPosition();
    _controllerPosition.latitude.value = position.latitude;
    _controllerPosition.longitude.value = position.longitude;
  }

  @override
  void initState() {
    super.initState();
    _fetchPosition();
  }

  @override
  Widget build(BuildContext context) {

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
}
