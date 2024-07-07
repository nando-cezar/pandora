import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandora_front/app/ui/widgets/my_square_tile.dart';
import 'package:pandora_front/constants.dart';

void main() {
  testWidgets('MySquareTile displays correctly and responds to taps',
      (WidgetTester tester) async {
    const String imagePath = 'assets/images/google.png';
    bool wasTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MySquareTile(
            imagePath: imagePath,
            onTap: () {
              wasTapped = true;
            },
          ),
        ),
      ),
    );

    expect(find.byType(Image), findsOneWidget);
    expect(
        find.byWidgetPredicate((widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName == imagePath),
        findsOneWidget);

    final container = tester.widget<Container>(find.byType(Container));
    final BoxDecoration decoration = container.decoration as BoxDecoration;
    expect(decoration.color, mySeventhColor);
    expect(decoration.borderRadius, BorderRadius.circular(16));
    expect((decoration.border as Border).top.color, myFifthColor);

    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    expect(wasTapped, true);
  });
}
