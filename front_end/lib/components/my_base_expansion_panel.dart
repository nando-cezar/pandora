import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBaseExpansionPanel<T> extends StatefulWidget {
  final RxList<T> items;
  final Widget Function(T) headerBuilder;
  final Widget Function(T) bodyBuilder;
  final void Function(int, bool) expansionCallback;

  const MyBaseExpansionPanel({
    super.key,
    required this.items,
    required this.headerBuilder,
    required this.bodyBuilder,
    required this.expansionCallback,
  });

  @override
  State<MyBaseExpansionPanel<T>> createState() => _MyExpansionPanelState<T>();
}

class _MyExpansionPanelState<T> extends State<MyBaseExpansionPanel<T>> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: ExpansionPanelList.radio(
          elevation: 8.0,
          dividerColor: Theme.of(context).colorScheme.secondary,
          expansionCallback: widget.expansionCallback,
          children: widget.items.map<ExpansionPanel>((T model) {
            return ExpansionPanelRadio(
              value: model as Object,
              backgroundColor: Theme.of(context).colorScheme.primary,
              canTapOnHeader: true,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return widget.headerBuilder(model);
              },
              body: widget.bodyBuilder(model),
            );
          }).toList(),
        ),
      ),
    );
  }
}
