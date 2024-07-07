import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandora_front/app/ui/widgets/my_radiobutton.dart';

void main() {
  group('MyRadioButton Widget Test', () {
    testWidgets('Initial value is set correctly', (WidgetTester tester) async {

      final TextEditingController controller = TextEditingController();
      const List<String> options = ['Option 1', 'Option 2', 'Option 3'];
      const String initialValue = 'Option 2';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MyRadioButton(
              controller: controller,
              options: options,
              initialValue: initialValue,
            ),
          ),
        ),
      );

      expect(controller.text, initialValue);
      expect(find.text(initialValue), findsOneWidget);
      expect(find.byType(Radio<String>), findsNWidgets(options.length));
    });

    testWidgets('Radio buttons are rendered correctly', (WidgetTester tester) async {

      final TextEditingController controller = TextEditingController();
      const List<String> options = ['Option 1', 'Option 2', 'Option 3'];
      const String initialValue = 'Option 1';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MyRadioButton(
              controller: controller,
              options: options,
              initialValue: initialValue,
            ),
          ),
        ),
      );

      for (var option in options) {
        expect(find.text(option), findsOneWidget);
        expect(find.byType(Radio<String>), findsNWidgets(options.length));
      }
    });
  });
}
