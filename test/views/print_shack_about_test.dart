import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/print_shack_about.dart';

void main() {
  group('Print Shack About Page Tests', () {
    testWidgets('PrintShackAboutPage renders without errors', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(PrintShackAboutPage), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('PrintShackAboutPage displays header', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.search), findsWidgets);
      expect(find.byIcon(Icons.person_outline), findsWidgets);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('PrintShackAboutPage has white background', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, Colors.white);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('PrintShackAboutPage is scrollable', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('PrintShackAboutPage displays title', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Find the page title (not the one in header)
      expect(find.text('The Print Shack'), findsNWidgets(2)); // Header + page title

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Title has correct styling', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      final titleTexts = tester.widgetList<Text>(find.text('The Print Shack'));
      final pageTitle = titleTexts.firstWhere((text) => text.style?.fontSize == 28);
      
      expect(pageTitle.style?.fontSize, 28);
      expect(pageTitle.style?.fontWeight, FontWeight.bold);
      expect(pageTitle.textAlign, TextAlign.center);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('PrintShackAboutPage displays welcome message', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Welcome to The Print Shack!'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('PrintShackAboutPage displays service description', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.textContaining('Our personalisation service allows you to customize'),
        findsOneWidget,
      );

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('PrintShackAboutPage displays services list', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Services we offer:'), findsOneWidget);
      expect(find.textContaining('Custom embroidery'), findsOneWidget);
      expect(find.textContaining('Screen printing'), findsOneWidget);
      expect(find.textContaining('Heat transfer printing'), findsOneWidget);
      expect(find.textContaining('Vinyl cutting'), findsOneWidget);
      expect(find.textContaining('Custom badges and patches'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('PrintShackAboutPage displays personalization info', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.textContaining('Whether you\'re looking to personalize a single item'),
        findsOneWidget,
      );

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('PrintShackAboutPage displays contact email', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('printshack@upsu.net'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('PrintShackAboutPage displays bulk order info', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('For bulk orders and society enquiries'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('PrintShackAboutPage displays closing message', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Let\'s make something unique together!'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('PrintShackAboutPage displays team signature', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('The Print Shack Team'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Content text has correct styling', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      final contentText = tester.widget<Text>(
        find.textContaining('Welcome to The Print Shack!'),
      );
      expect(contentText.style?.fontSize, 18);
      expect(contentText.style?.height, 1.6);
      expect(contentText.textAlign, TextAlign.left);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Content has max width constraint', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      final constrainedBox = tester.widget<ConstrainedBox>(
        find.ancestor(
          of: find.textContaining('Welcome to The Print Shack!'),
          matching: find.byType(ConstrainedBox),
        ),
      );

      expect(constrainedBox.constraints.maxWidth, 720);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Content has correct padding', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Find padding that contains the page title (not header)
      final paddings = tester.widgetList<Padding>(
        find.ancestor(
          of: find.textContaining('Welcome to The Print Shack!'),
          matching: find.byType(Padding),
        ),
      );

      final contentPadding = paddings.firstWhere(
        (p) => p.padding == const EdgeInsets.fromLTRB(24, 32, 24, 24),
      );

      expect(contentPadding.padding, const EdgeInsets.fromLTRB(24, 32, 24, 24));

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Content is centered', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      final columns = tester.widgetList<Column>(
        find.ancestor(
          of: find.textContaining('Welcome to The Print Shack!'),
          matching: find.byType(Column),
        ),
      );

      final contentColumn = columns.firstWhere(
        (col) => col.crossAxisAlignment == CrossAxisAlignment.center,
      );

      expect(contentColumn.crossAxisAlignment, CrossAxisAlignment.center);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('PrintShackAboutPage displays footer', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Opening Hours'), findsWidgets);
      expect(find.text('Help and Information'), findsWidgets);
      expect(find.text('© 2025, upsu-store'), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Page layout is consistent', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(Column), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Spacing between title and content is correct', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
      final spacingAfterTitle = sizedBoxes.firstWhere(
        (box) => box.height == 12,
      );

      expect(spacingAfterTitle.height, 12);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Bottom spacing is correct', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackAboutPage(),
        ),
      );
      await tester.pumpAndSettle();

      final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
      final bottomSpacing = sizedBoxes.firstWhere(
        (box) => box.height == 40,
      );

      expect(bottomSpacing.height, 40);

      await tester.binding.setSurfaceSize(null);
    });
  });
}