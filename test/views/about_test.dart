import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/about_page.dart';

void main() {
  group('About Page Tests', () {
    testWidgets('AboutPage renders without errors', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(AboutPage), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AboutPage displays header', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsWidgets); // Logo
      expect(find.byIcon(Icons.search), findsWidgets);
      expect(find.byIcon(Icons.person_outline), findsWidgets);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AboutPage displays navigation with About active', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsWidgets);
      expect(find.textContaining('Shop'), findsWidgets);
      expect(find.text('About'), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AboutPage is scrollable', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AboutPage has white background', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, Colors.white);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AboutPage displays "About us" heading', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('About us'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AboutPage heading has correct styling', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      final textWidget = tester.widget<Text>(find.text('About us'));
      expect(textWidget.style?.fontSize, 28);
      expect(textWidget.style?.fontWeight, FontWeight.bold);
      expect(textWidget.textAlign, TextAlign.center);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AboutPage displays welcome message', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Welcome to the Union Shop!'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AboutPage displays personalisation information', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('exclusive personalisation service'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AboutPage displays delivery information', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('delivery or instore collection'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AboutPage displays contact email', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('hello@upsu.net'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AboutPage displays team signature', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('The Union Shop & Reception Team'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AboutPage has proper layout structure', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Just verify it has padding and constrained box
      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(ConstrainedBox), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AboutPage displays footer', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Opening Hours'), findsWidgets);
      expect(find.text('Help and Information'), findsWidgets);
      expect(find.text('© 2025, upsu-store'), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AboutPage displays social media icons in footer', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.facebook), findsWidgets);
      expect(find.byIcon(Icons.share), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });
  });
}