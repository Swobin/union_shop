import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/sale_page.dart';

void main() {
  group('Sale Page Tests', () {
    testWidgets('SalePage renders without errors', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SalePage), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('SalePage displays header', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.search), findsWidgets);
      expect(find.byIcon(Icons.person_outline), findsWidgets);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('SalePage has white background', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, Colors.white);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('SalePage is scrollable', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('SalePage displays sale banner', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('SALE'), findsWidgets);
      expect(find.text('WINTER SALE - UP TO 50% OFF!'), findsOneWidget);
      expect(find.text('Limited time offer - While stocks last!'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Sale banner has SHOP NOW button', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('SHOP NOW'), findsOneWidget);
      expect(find.widgetWithText(ElevatedButton, 'SHOP NOW'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Sale banner has gradient background', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      final bannerContainer = tester.widget<Container>(
        find.ancestor(
          of: find.text('WINTER SALE - UP TO 50% OFF!'),
          matching: find.byType(Container),
        ).first,
      );

      final decoration = bannerContainer.decoration as BoxDecoration;
      expect(decoration.gradient, isNotNull);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('SalePage displays countdown timer', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('SALE ENDS IN:'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Countdown timer displays time units', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('02'), findsOneWidget); // days
      expect(find.text('14'), findsOneWidget); // hours
      expect(find.text('32'), findsOneWidget); // mins
      expect(find.text('45'), findsOneWidget); // secs
      expect(find.text('DAYS'), findsOneWidget);
      expect(find.text('HOURS'), findsOneWidget);
      expect(find.text('MINS'), findsOneWidget);
      expect(find.text('SECS'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Countdown timer has colons separator', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(':'), findsNWidgets(3)); // 3 colons between 4 time units

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('SalePage displays product count', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Showing 12 sale items'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('SalePage displays discount filter dropdown', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Scroll to filter controls
      await tester.ensureVisible(find.text('Discount: All'));
      await tester.pumpAndSettle();

      expect(find.text('Discount: All'), findsOneWidget);
      expect(find.byType(DropdownButton<String>), findsNWidgets(2)); // discount + sort

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('SalePage displays sort dropdown', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Scroll to filter controls
      await tester.ensureVisible(find.text('Sort by: Featured'));
      await tester.pumpAndSettle();

      expect(find.text('Sort by: Featured'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('SalePage displays Sale Items title', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Scroll to Sale Items title
      await tester.ensureVisible(find.text('Sale Items'));
      await tester.pumpAndSettle();

      expect(find.text('Sale Items'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('SalePage displays product grid', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GridView), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('SalePage displays 12 products', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Scroll to products
      await tester.ensureVisible(find.text('Essential Zip Hoodie'));
      await tester.pumpAndSettle();

      expect(find.text('Essential Zip Hoodie'), findsOneWidget);
      expect(find.text('Union Notebook'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Product cards display images', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Product cards display discount badges', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Scroll to see products
      await tester.ensureVisible(find.text('Essential Zip Hoodie'));
      await tester.pumpAndSettle();

      expect(find.text('-25%'), findsWidgets);
      expect(find.text('-30%'), findsOneWidget);
      expect(find.text('-40%'), findsNWidgets(3)); // 3 products with 40% off

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Product cards display SALE badges', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('SALE'), findsWidgets); // Multiple SALE badges

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Product cards display Limited badges', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Scroll to see products
      await tester.ensureVisible(find.text('Essential Zip Hoodie'));
      await tester.pumpAndSettle();

      expect(find.text('Limited'), findsWidgets);
      expect(find.byIcon(Icons.access_time), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Product cards display old and sale prices', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Scroll to see products
      await tester.ensureVisible(find.text('Essential Zip Hoodie'));
      await tester.pumpAndSettle();

      expect(find.text('£20.00'), findsOneWidget); // old price
      expect(find.text('£14.99'), findsNWidgets(2)); // sale price (appears twice)

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Product cards display savings amount', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Scroll to see products
      await tester.ensureVisible(find.text('Essential Zip Hoodie'));
      await tester.pumpAndSettle();

      expect(find.textContaining('Save £'), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Product cards are tappable', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        MaterialApp(
          home: const SalePage(),
          routes: {
            '/product-detail': (context) => const Scaffold(
              body: Text('Product Detail Page'),
            ),
          },
        ),
      );
      await tester.pumpAndSettle();

      // Scroll to make product visible
      await tester.ensureVisible(find.text('Essential Zip Hoodie'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Essential Zip Hoodie'));
      await tester.pumpAndSettle();

      expect(find.text('Product Detail Page'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('SalePage displays footer', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
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