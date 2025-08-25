// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_app/screens/splash_screen.dart';
import 'package:first_app/main.dart';

void main() {
  testWidgets('SplashScreen displays welcome text', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: SplashScreen()));

    expect(find.text('Welcome in BagBagCars'), findsOneWidget);
  });

  testWidgets('SplashScreen navigates to MyHomePage after 3 seconds', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: SplashScreen()));

    // SplashScreen should be visible initially
    expect(find.text('Welcome in BagBagCars'), findsOneWidget);

    // Simulate 3 seconds passing
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // After navigation, MyHomePage should be present
    expect(find.byType(BagBagCarsApp), findsOneWidget);
  });
}
