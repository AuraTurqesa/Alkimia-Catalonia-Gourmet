import 'package:catalonia_gourmet/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SplashScreen loads and shows logo', (WidgetTester tester) async {
    await tester.pumpWidget(const CataloniaGourmetApp());

    // Esperem que aparegui el text "Catalonia Gourmet"
    expect(find.text('Catalonia Gourmet'), findsOneWidget);

    // Esperem que hi hagi una imatge (logo)
    expect(find.byType(Image), findsOneWidget);
  });
}
