import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/footer.dart';

void main() {
  test('footer widget exists', () {
    expect(AppFooter, isNotNull);
  });

  group('AppFooter Essential Tests', () {
    testWidgets('footer renders without errors', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: AppFooter(),
            ),
          ),
        ),
      );
      
      expect(find.byType(AppFooter), findsOneWidget);
    });

    testWidgets('displays all three main section headers', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: AppFooter(),
            ),
          ),
        ),
      );

      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Help and Information'), findsOneWidget);
      expect(find.text('Latest Offers'), findsOneWidget);
    });

    testWidgets('displays winter closure information', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: AppFooter(),
            ),
          ),
        ),
      );

      expect(find.textContaining('Winter Break'), findsOneWidget);
      expect(find.textContaining('19/12/2025'), findsOneWidget);
      expect(find.textContaining('05/01/2026'), findsOneWidget);
    });

    testWidgets('displays newsletter subscription section', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: AppFooter(),
            ),
          ),
        ),
      );

      expect(find.text('Email address'), findsOneWidget);
      expect(find.text('SUBSCRIBE'), findsOneWidget);
    });

    testWidgets('displays help links', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: AppFooter(),
            ),
          ),
        ),
      );

      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Terms & Conditions of Sale'), findsOneWidget);
      expect(find.text('Policy'), findsOneWidget);
    });

    testWidgets('displays social media icons', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: AppFooter(),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.facebook), findsOneWidget);
      expect(find.byIcon(Icons.share), findsOneWidget);
    });

    testWidgets('displays copyright text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: AppFooter(),
            ),
          ),
        ),
      );

      expect(find.text('© 2025, upsu-store'), findsOneWidget);
    });
  });
}