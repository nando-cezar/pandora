import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/my_base_expansion_panel.dart';
import '../components/my_base_graph.dart';
import '../constants.dart';
import '../controller/device_controller.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {

  final DeviceController _controllerDevice = Get.put(DeviceController());

  _fetchDevice() async {
    _controllerDevice.index.value = 1;
  }

  @override
  void initState() {
    _fetchDevice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myFifthColor,
      body: Column(
        children: [
          const Expanded(
            child: MyBaseGraph(),
          ),
          Expanded(
            child: MyBaseExpansionPanel(),
          )
        ],
      ),
    );
  }
}
