import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/my_expansion_panel.dart';
import '../components/my_base_graph.dart';
import '../controller/device_controller.dart';
import '../state/device_state.dart';

class TableScaffold extends StatefulWidget {
  const TableScaffold({super.key});

  @override
  State<TableScaffold> createState() => _TableScaffoldState();
}

class _TableScaffoldState extends State<TableScaffold> {
  final _controllerDevice = Get.put(DeviceController());

  _fetchDevice() async {
    _controllerDevice.changeState(DeviceState.tablet);
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
