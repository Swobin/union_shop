import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/header.dart';

/// Tests for AppHeader widget
void main() {
  // Set up HTTP overrides for Image.network
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('AppHeader Essential Tests', () {
    testWidgets('Header renders without errors on desktop', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              child: AppHeader(activePage: 'home'),
            ),
          ),
        ),
      );

      expect(find.byType(AppHeader), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Header displays navigation items on desktop', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1024, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              child: AppHeader(activePage: 'home'),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Shop'), findsOneWidget);
      expect(find.text('The Print Shack'), findsOneWidget);
      expect(find.text('SALE!'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Header displays utility icons on desktop', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              child: AppHeader(activePage: 'home'),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Header logo is displayed', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              child: AppHeader(activePage: 'home'),
            ),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Header displays sale banner', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              child: AppHeader(activePage: 'home'),
            ),
          ),
        ),
      );

      expect(find.textContaining('BIG SALE'), findsOneWidget);
      expect(find.textContaining('ESSENTIAL RANGE'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Header accepts different active pages', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200,
              child: AppHeader(activePage: 'shop'),
            ),
          ),
        ),
      );

      expect(find.byType(AppHeader), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });
  });
}