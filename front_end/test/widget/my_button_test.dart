import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandora_front/app/ui/widgets/my_button.dart';

void main() {
  testWidgets('MyButton onTap callback', (WidgetTester tester) async {
    bool onTapCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: MyButton(
            onTap: () {
              onTapCalled = true;
            },
            text: 'Press Me',
          ),
        ),
      ),
    );

    final buttonFinder = find.byType(MyButton);
    expect(buttonFinder, findsOneWidget);

    await tester.tap(buttonFinder);
    await tester.pump();

    expect(onTapCalled, true);
  });
}
