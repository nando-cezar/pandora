import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/my_expansion_panel.dart';
import '../components/my_bargraph.dart';
import '../constants.dart';
import '../controller/device_controller.dart';
import '../controller/extreme_event_controller.dart';
import '../model/extreme_event _model.dart';

class TableScaffold extends StatefulWidget {
  const TableScaffold({super.key});

  @override
  State<TableScaffold> createState() => _TableScaffoldState();
}

class _TableScaffoldState extends State<TableScaffold> {
  final ExtremeEventController _controllerExtremeEvent = Get.put(ExtremeEventController());
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
            child: MyBarGraph(),
          ),
          Expanded(
            child: MyExpansionPanel<ExtremeEventModel>(
              items: _controllerExtremeEvent.items,
              headerBuilder: (ExtremeEventModel model) {
                return ListTile(
                  contentPadding: const EdgeInsets.all(5.0),
                  title: Text(model.description),
                  leading: CircleAvatar(
                    backgroundColor: myActiveColor,
                    child: Text(
                      model.id.toString(),
                      style: TextStyle(color: myFifthColor),
                    ),
                  ),
                );
              },
              bodyBuilder: (ExtremeEventModel model) {
                return ListTile(
                  title: Text(model.description),
                  subtitle: Text(model.apparent_temperature_max.max.toString()),
                );
              },
              expansionCallback: (int index, bool isExpanded) {
                _controllerExtremeEvent.items[index].isExpanded = isExpanded;
              },
            ),
          )
        ],
      ),
    );
  }
}
