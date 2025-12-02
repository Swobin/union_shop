import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Home Page Tests', () {
    testWidgets('App renders without errors', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      expect(find.byType(UnionShopApp), findsOneWidget);
      expect(find.byType(MaterialApp), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('App displays HomeScreen', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('App has correct title', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.title, 'Union Shop');

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('App debug banner is hidden', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.debugShowCheckedModeBanner, false);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('App uses correct theme color', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.theme?.colorScheme.primary, const Color(0xFF735187));

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomeScreen is scrollable', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomeScreen displays sale banner text', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      expect(find.textContaining('BIG SALE'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomeScreen displays logo', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomeScreen displays navigation on desktop', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsWidgets);
      expect(find.textContaining('Shop'), findsWidgets);
      expect(find.text('About'), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomeScreen displays utility icons', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomeScreen displays hero section', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      expect(find.textContaining('ESSENTIAL RANGE'), findsWidgets);
      expect(find.text('BROWSE COLLECTION'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomeScreen displays product sections', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      expect(find.text('Signature Range'), findsOneWidget);
      expect(find.text('Portsmouth City Collection'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomeScreen displays footer', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Help and Information'), findsOneWidget);
      expect(find.text('Latest Offers'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomeScreen displays copyright', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      expect(find.text('© 2025, upsu-store'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomeScreen displays social media icons', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.facebook), findsWidgets);
      expect(find.byIcon(Icons.share), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });
  });
}
