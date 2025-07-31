import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trendy/main.dart';

void main() {
  testWidgets('HomeScreen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the HomeScreen is displayed.
    expect(find.text('Trendy'), findsOneWidget);
    expect(find.text('Home Feed'), findsOneWidget);
  });
}
