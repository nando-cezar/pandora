import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/my_base_expansion_panel.dart';
import '../components/my_base_graph.dart';
import '../constants.dart';
import '../controller/device_controller.dart';
import '../state/device_state.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  final DeviceController _controllerDevice = Get.put(DeviceController());

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
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                const Expanded(
                  child: MyBaseGraph(),
                ),
                Expanded(
                  child: MyBaseExpansionPanel(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: myActiveColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
