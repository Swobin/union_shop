import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/essential_range_page.dart';

void main() {
  group('Essential Range Page Tests', () {
    testWidgets('EssentialRangePage renders without errors', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: EssentialRangePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(EssentialRangePage), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('EssentialRangePage displays header', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: EssentialRangePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.search), findsWidgets);
      expect(find.byIcon(Icons.person_outline), findsWidgets);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('EssentialRangePage has white background', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: EssentialRangePage(),
        ),
      );
      await tester.pumpAndSettle();

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, Colors.white);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('EssentialRangePage is scrollable', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: EssentialRangePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('EssentialRangePage displays sale banner', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: EssentialRangePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('ESSENTIAL RANGE - OVER 20% OFF!'), findsOneWidget);
      expect(find.text('Limited time offer - While stocks last!'), findsOneWidget);
      expect(find.text('SAVE UP TO 25%'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Sale banner has gradient background', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: EssentialRangePage(),
        ),
      );
      await tester.pumpAndSettle();

      final bannerContainer = tester.widget<Container>(
        find.ancestor(
          of: find.text('ESSENTIAL RANGE - OVER 20% OFF!'),
          matching: find.byType(Container),
        ).first,
      );

      final decoration = bannerContainer.decoration as BoxDecoration;
      expect(decoration.gradient, isNotNull);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('EssentialRangePage displays product count', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: EssentialRangePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Showing 8 sale items'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('EssentialRangePage displays sort dropdown', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: EssentialRangePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(DropdownButton<String>), findsOneWidget);
      expect(find.text('Sort: Featured'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Sort dropdown can change selection', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: EssentialRangePage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pumpAndSettle();

      expect(find.text('Sort: Price: Low to High'), findsOneWidget);

      await tester.tap(find.text('Sort: Price: Low to High').last);
      await tester.pumpAndSettle();

      expect(find.text('Sort: Price: Low to High'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('EssentialRangePage displays product grid', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: EssentialRangePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GridView), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('EssentialRangePage displays 8 products', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: EssentialRangePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Essential Zip Hoodie'), findsOneWidget);
      expect(find.text('Essential Shorts'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Product items display images', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: EssentialRangePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Product items display discount badges', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: EssentialRangePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('-25%'), findsWidgets);
      expect(find.text('-30%'), findsOneWidget);
      expect(find.text('-40%'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Product items display old and new prices', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: EssentialRangePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('£20.00'), findsOneWidget);
      expect(find.text('£14.99'), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Product items are tappable', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        MaterialApp(
          home: const EssentialRangePage(),
          routes: {
            '/product-detail': (context) => const Scaffold(
              body: Text('Product Detail Page'),
            ),
          },
        ),
      );
      await tester.pumpAndSettle();

      // Scroll to make the product visible
      await tester.ensureVisible(find.text('Essential Zip Hoodie'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Essential Zip Hoodie'));
      await tester.pumpAndSettle();

      expect(find.text('Product Detail Page'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Grid has 4 columns', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: EssentialRangePage(),
        ),
      );
      await tester.pumpAndSettle();

      final gridView = tester.widget<GridView>(find.byType(GridView));
      final delegate = gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
      expect(delegate.crossAxisCount, 4);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Grid has correct spacing', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: EssentialRangePage(),
        ),
      );
      await tester.pumpAndSettle();

      final gridView = tester.widget<GridView>(find.byType(GridView));
      final delegate = gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
      expect(delegate.crossAxisSpacing, 24);
      expect(delegate.mainAxisSpacing, 24);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('EssentialRangePage displays footer', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: EssentialRangePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Opening Hours'), findsWidgets);
      expect(find.text('Help and Information'), findsWidgets);
      expect(find.text('© 2025, upsu-store'), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });
  });
}