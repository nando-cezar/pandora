import 'package:flutter/material.dart';

class BaseExpansionPanel<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T) headerBuilder;
  final Widget Function(T) bodyBuilder;
  final void Function(int, bool) expansionCallback;

  const BaseExpansionPanel({
    super.key,
    required this.items,
    required this.headerBuilder,
    required this.bodyBuilder,
    required this.expansionCallback,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: ExpansionPanelList.radio(
          elevation: 8.0,
          dividerColor: Theme.of(context).colorScheme.secondary,
          expansionCallback: expansionCallback,
          children: items.map<ExpansionPanel>((T model) {
            return ExpansionPanelRadio(
              value: model as Object,
              backgroundColor: Theme.of(context).colorScheme.primary,
              canTapOnHeader: true,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return headerBuilder(model);
              },
              body: bodyBuilder(model),
            );
          }).toList(),
        ),
      ),
    );
  }
}
