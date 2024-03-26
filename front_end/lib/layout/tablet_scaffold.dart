import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/my_base_expansion_panel.dart';
import '../components/my_base_graph.dart';
import '../constants.dart';
import '../controller/device_controller.dart';

class TableScaffold extends StatefulWidget {
  const TableScaffold({super.key});

  @override
  State<TableScaffold> createState() => _TableScaffoldState();
}

class _TableScaffoldState extends State<TableScaffold> {

  final DeviceController _controllerDevice = Get.put(DeviceController());

  _fetchPosition() async {
    _controllerDevice.index.value = 2;
  }

  @override
  void initState() {
    _fetchPosition();
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
