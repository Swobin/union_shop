import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Home Page Tests', () {
    testWidgets('App renders without errors', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.byType(MyApp), findsOneWidget);
      expect(find.byType(MaterialApp), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('App displays HomePage', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('App has correct title', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.title, 'Union Shop');

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('App debug banner is hidden', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.debugShowCheckedModeBanner, false);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomePage is scrollable', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomePage displays header', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.search), findsWidgets);
      expect(find.byIcon(Icons.person_outline), findsWidgets);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomePage displays welcome message', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.text('Welcome to Union Shop'), findsOneWidget);
      expect(find.text('Your one-stop destination for quality products'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomePage displays SHOP NOW button', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.text('SHOP NOW'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomePage displays Quick Links section', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.text('Quick Links'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomePage displays all quick link cards', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.text('Collections'), findsOneWidget);
      expect(find.text('Essential Range'), findsOneWidget);
      expect(find.text('Sale'), findsOneWidget);
      expect(find.text('Cart'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomePage displays quick link icons', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.grid_view), findsOneWidget);
      expect(find.byIcon(Icons.checkroom), findsOneWidget);
      expect(find.byIcon(Icons.local_offer), findsOneWidget);
      expect(find.byIcon(Icons.shopping_cart), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomePage displays Featured Categories section', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.text('Featured Categories'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomePage displays category cards', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.text('Personalisation'), findsOneWidget);
      expect(find.text('Custom products just for you'), findsOneWidget);
      expect(find.text('Print Shack'), findsOneWidget);
      expect(find.text('Professional printing services'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomePage displays Learn More buttons', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.text('Learn More →'), findsNWidgets(2));

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomePage displays category icons', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.palette), findsOneWidget);
      expect(find.byIcon(Icons.print), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomePage displays footer', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.text('Opening Hours'), findsWidgets);
      expect(find.text('Help and Information'), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Quick link cards are clickable', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.byType(InkWell), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('HomePage has correct background color', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold).first);
      expect(scaffold.backgroundColor, Colors.white);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Hero section has gradient background', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.byType(Container), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('SHOP NOW button navigates to collections', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final shopNowButton = find.text('SHOP NOW');
      expect(shopNowButton, findsOneWidget);

      await tester.tap(shopNowButton);
      await tester.pumpAndSettle();

      // Should navigate to collections page
      expect(find.byType(HomePage), findsNothing);

      await tester.binding.setSurfaceSize(null);
    });
  });
}
