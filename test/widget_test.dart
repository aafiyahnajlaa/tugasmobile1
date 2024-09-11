import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tugaskalkulator/main.dart';

void main() {
  testWidgets('Login and navigate to HomePage', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the login fields are present.
    expect(find.byType(TextField), findsNWidgets(2)); // Username and password
    expect(find.text('Login'), findsOneWidget);

    // Enter username and password.
    await tester.enterText(find.byType(TextField).first, 'testuser');
    await tester.enterText(find.byType(TextField).last, 'testpass');

    // Tap the login button.
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle(); // Wait for the navigation to complete.

    // Verify that we are on the HomePage now.
    expect(find.text('Menu Utama'), findsOneWidget);
  });
}