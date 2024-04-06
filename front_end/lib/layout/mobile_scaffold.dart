import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/my_expansion_panel.dart';
import '../components/my_base_graph.dart';
import '../controller/device_controller.dart';
import '../state/device_state.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  final DeviceController _controllerDevice = Get.put(DeviceController());

  _fetchDevice() async {
    _controllerDevice.changeState(DeviceState.mobile);
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 500,
              child: MyBaseGraph(),
            ),
            MyExpansionPanel(),
          ],
        ),
      ),
    );
  }
}
