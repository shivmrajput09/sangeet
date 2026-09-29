// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:tripfy/main.dart';

void main() {
  // The app now opens the music home screen, not Flutter's counter template.
  testWidgets('Home screen displays its main sections', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Daily fours for you'), findsOneWidget);
    expect(find.text('Recent played'), findsOneWidget);
  });
}
