import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class MyExpansionPanel<T> extends StatefulWidget {
  final RxList<T> items;
  final Widget Function(T) headerBuilder;
  final Widget Function(T) bodyBuilder;
  final void Function(int, bool) expansionCallback;

  const MyExpansionPanel({
    super.key,
    required this.items,
    required this.headerBuilder,
    required this.bodyBuilder,
    required this.expansionCallback,
  });

  @override
  State<MyExpansionPanel<T>> createState() => _MyExpansionPanelState<T>();
}

class _MyExpansionPanelState<T> extends State<MyExpansionPanel<T>> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10.0),
      child: ExpansionPanelList.radio(
        expansionCallback: widget.expansionCallback,
        children: widget.items.map<ExpansionPanel>((T model) {
          return ExpansionPanelRadio(
            value: model as Object,
            backgroundColor: myFifthColor,
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return widget.headerBuilder(model);
            },
            body: widget.bodyBuilder(model),
          );
        }).toList(),
      ),
    );
  }
}