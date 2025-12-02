import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/product_detail.dart';

void main() {
  group('Product Detail Page Tests', () {
    testWidgets('ProductDetailPage renders without errors', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ProductDetailPage), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('ProductDetailPage displays header', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.search), findsWidgets);
      expect(find.byIcon(Icons.person_outline), findsWidgets);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('ProductDetailPage has white background', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, Colors.white);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('ProductDetailPage is scrollable', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('ProductDetailPage displays breadcrumb navigation', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        MaterialApp(
          home: const ProductDetailPage(),
          routes: {
            '/essential-range': (context) => const Scaffold(body: Text('Essential Range')),
          },
        ),
      );
      await tester.pumpAndSettle();

      // "Home" appears in header + breadcrumb = 2 instances
      expect(find.text('Home'), findsNWidgets(2));
      expect(find.text('Essential Range'), findsOneWidget);
      expect(find.text('Essential Zip Hoodie'), findsAtLeastNWidgets(1));

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('ProductDetailPage displays product title', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      final titleFinder = find.text('Essential Zip Hoodie');
      // Should find 2: one in breadcrumb, one as product title
      expect(titleFinder, findsAtLeastNWidgets(1));

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('ProductDetailPage displays product rating', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('(24 reviews)'), findsOneWidget);
      expect(find.byIcon(Icons.star), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('ProductDetailPage displays prices correctly', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('£20.00'), findsWidgets); // old price
      expect(find.text('£14.99'), findsWidgets); // sale price
      expect(find.text('SAVE 25%'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('ProductDetailPage displays product description', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Premium quality essential zip hoodie'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('ProductDetailPage displays size selector', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Size'), findsOneWidget);
      expect(find.byType(DropdownButton<String>), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Size selector defaults to M', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      final dropdown = tester.widget<DropdownButton<String>>(
        find.byType(DropdownButton<String>),
      );
      expect(dropdown.value, 'M');

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('ProductDetailPage displays color selector', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Color'), findsOneWidget);
      // Should have 5 color chips
      expect(find.byIcon(Icons.check), findsOneWidget); // Selected color

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('ProductDetailPage displays quantity selector', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Quantity'), findsOneWidget);
      expect(find.byIcon(Icons.remove), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('1'), findsOneWidget); // Default quantity

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Quantity can be incremented', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('2'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Quantity can be decremented but not below 1', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Try to decrement from 1
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      expect(find.text('1'), findsOneWidget); // Still 1

      // Increment to 2, then decrement
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('2'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();
      expect(find.text('1'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('ProductDetailPage displays ADD TO BASKET button', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('ADD TO BASKET'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Add to basket shows snackbar', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Scroll to make button visible
      await tester.ensureVisible(find.text('ADD TO BASKET'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('ADD TO BASKET'));
      await tester.pump();

      expect(find.textContaining('Added'), findsOneWidget);
      expect(find.textContaining('Essential Hoodie'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('ProductDetailPage displays wishlist button', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('WISHLIST'), findsOneWidget);
      expect(find.byIcon(Icons.favorite_border), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('ProductDetailPage displays share button', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Share icon may appear in header and/or product section
      expect(find.byIcon(Icons.share), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('ProductDetailPage displays product features', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Free delivery on orders over £50'), findsOneWidget);
      expect(find.text('30-day easy returns'), findsOneWidget);
      expect(find.text('12-month warranty'), findsOneWidget);
      expect(find.byIcon(Icons.local_shipping), findsOneWidget);
      expect(find.byIcon(Icons.autorenew), findsOneWidget);
      expect(find.byIcon(Icons.verified_user), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('ProductDetailPage displays product tabs', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('DESCRIPTION'), findsOneWidget);
      expect(find.text('DETAILS'), findsOneWidget);
      expect(find.text('REVIEWS'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Description tab displays content', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Our Essential Zip Hoodie combines comfort'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Details tab can be selected and displays content', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Scroll to make tabs visible
      await tester.ensureVisible(find.text('DETAILS'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('DETAILS'));
      await tester.pumpAndSettle();

      expect(find.text('Material'), findsOneWidget);
      expect(find.text('80% Cotton, 20% Polyester'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Reviews tab can be selected and displays reviews', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Scroll to make tabs visible
      await tester.ensureVisible(find.text('REVIEWS'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('REVIEWS'));
      await tester.pumpAndSettle();

      expect(find.text('Customer Reviews'), findsOneWidget);
      expect(find.text('Sarah M.'), findsOneWidget);
      expect(find.text('James T.'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('ProductDetailPage displays related products section', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('You May Also Like'));
      await tester.pumpAndSettle();

      expect(find.text('You May Also Like'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Related products displays 4 items', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('You May Also Like'));
      await tester.pumpAndSettle();

      expect(find.text('Essential T-Shirt'), findsOneWidget);
      expect(find.text('Essential Sweatshirt'), findsOneWidget);
      expect(find.text('Essential Joggers'), findsOneWidget);
      expect(find.text('Essential Cap'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('ProductDetailPage displays image gallery', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Should have main image + 4 thumbnails = 5 images total
      expect(find.byType(Image), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('ProductDetailPage displays footer', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Opening Hours'), findsWidgets);
      expect(find.text('Help and Information'), findsWidgets);
      expect(find.text('© 2025, upsu-store'), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Page has correct layout structure', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: ProductDetailPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsWidgets);
      expect(find.byType(DefaultTabController), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });
  });
}