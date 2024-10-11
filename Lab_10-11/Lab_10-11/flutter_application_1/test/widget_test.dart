import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/auth/home.dart';

void main() {

  testWidgets('Drag worker card', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MyHomePage()));


    final textFieldFinder = find.byKey(Key("addField"));
    await tester.enterText(textFieldFinder, 'Test Worker');
    await tester.tap(find.byKey(Key("addButton")));
    await tester.pumpAndSettle();

    final draggableFinder = find.byType(Draggable);
    await tester.drag(draggableFinder, Offset(0, 100));
    await tester.pumpAndSettle();


    expect(find.text('Test Worker'), findsOneWidget);
  });

}