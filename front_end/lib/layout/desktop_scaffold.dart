import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/my_expansion_panel.dart';
import '../components/my_base_graph.dart';
import '../constants.dart';
import '../controller/device_controller.dart';
import '../pages/map_page.dart';
import '../state/device_state.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  final _controllerDevice = Get.put(DeviceController());

  _fetchDevice() async {
    _controllerDevice.changeState(DeviceState.desktop);
  }

  @override
  void initState() {
    _fetchDevice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: _controllerDevice.state.value == DeviceState.mobile
                        ? 500
                        : 700,
                    child: const MyBaseGraph(
                      title: 'EXTREME EVENTS',
                      subtitle: 'Prediction chart based on current location',
                    ),
                  ),
                  MyExpansionPanel(),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  child: MapPage(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
