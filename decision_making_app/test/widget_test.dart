// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:decision_making_app/DecisionMakingApp.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UI Tests', () {
    testWidgets('test basic workflow', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const DecisionMakingApp());

      //find shuffle_sharp icon in splash screen
      expect(find.byIcon(Icons.shuffle_sharp), findsOneWidget);

      //Timer will show up for 5 seconds...
      await tester.pumpAndSettle(Duration(seconds: 5));

      //Expect that the StartWidget has just one edit button and no add button
      expect(find.byIcon(Icons.language), findsOneWidget);
      expect(find.byIcon(Icons.add), findsNothing);

      //Click on the edit button
      await tester.tap(find.byIcon(Icons.edit));
      await tester.pumpAndSettle();

      //Expect a home button in the EditEntscheidungen.dart Widget
      expect(find.byIcon(Icons.home), findsOneWidget);
    });

    testWidgets('add option', (WidgetTester tester) async {
      const question = "Sample Question?";
      // Build our app and trigger a frame.
      await tester.pumpWidget(const DecisionMakingApp());

      //Timer will show up for 5 seconds...
      await tester.pumpAndSettle(Duration(seconds: 5));

      //Click on the edit button
      await tester.tap(find.byIcon(Icons.edit));
      await tester.pumpAndSettle();

      //Click on the edit button
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Enter a new question into the TextField.
      await tester.enterText(find.byType(TextField), question);

      await tester.tap(find.byIcon(Icons.home));
      await tester.pumpAndSettle();

      // Ensure that the item is on the main screen now
      expect(find.text(question), findsOneWidget);
    });
  });
}
