import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/collection_page.dart';

void main() {
  group('Collection Page Tests', () {
    testWidgets('CollectionPage renders without errors', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(CollectionPage), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('CollectionPage displays header', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsWidgets);
      expect(find.byIcon(Icons.search), findsWidgets);
      expect(find.byIcon(Icons.person_outline), findsWidgets);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('CollectionPage has white background', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );
      await tester.pumpAndSettle();

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, Colors.white);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('CollectionPage is scrollable', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('CollectionPage displays collection title', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Portsmouth City Collection'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('CollectionPage displays product count', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('12 products'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('CollectionPage displays sort dropdown', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(DropdownButton<String>), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('CollectionPage displays product grid', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GridView), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Product items display images', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Product items display prices', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('£'), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('CollectionPage displays footer', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Opening Hours'), findsWidgets);
      expect(find.text('Help and Information'), findsWidgets);
      expect(find.text('© 2025, upsu-store'), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('CollectionPage displays navigation', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsWidgets);
      expect(find.textContaining('Shop'), findsWidgets);
      expect(find.text('About'), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });
  });
}