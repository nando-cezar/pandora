import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/my_base_graph.dart';
import '../components/my_expansion_panel.dart';
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

  final DeviceController _controllerDevice = Get.put(DeviceController());
  final ExtremeEventController _controllerExtremeEvent = Get.put(ExtremeEventController());

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
            child: MyExpansionPanel<ExtremeEventModel>(
              items: _controllerExtremeEvent.items,
              headerBuilder: (ExtremeEventModel model) {
                return ListTile(
                  contentPadding: const EdgeInsets.all(5.0),
                  title: Text(model.description),
                  leading: CircleAvatar(
                    backgroundColor: myActiveColor,
                    child: Text(
                      model.code_formatted.toString(),
                      style: TextStyle(color: myFifthColor),
                    ),
                  ),
                );
              },
              bodyBuilder: (ExtremeEventModel model) {
                return ListTile(
                  title: Text(model.description),
                  subtitle: Text(model.mean.values.toString()),
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
