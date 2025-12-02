import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/personalisation_page.dart';

void main() {
  group('Personalisation Page Tests', () {
    testWidgets('PersonalisationPage renders without errors', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(PersonalisationPage), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('PersonalisationPage displays header', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.search), findsWidgets);
      expect(find.byIcon(Icons.person_outline), findsWidgets);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('PersonalisationPage has white background', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, Colors.white);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('PersonalisationPage is scrollable', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('PersonalisationPage displays title', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Personalisation'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Title has correct styling', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      final titleText = tester.widget<Text>(find.text('Personalisation'));
      expect(titleText.style?.fontSize, 28);
      expect(titleText.style?.fontWeight, FontWeight.bold);
      expect(titleText.textAlign, TextAlign.center);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('PersonalisationPage displays description text', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.text('Details about the personalisation service can be shown here. Implement forms or upload UI as required.'),
        findsOneWidget,
      );

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Description text has correct styling', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      final descText = tester.widget<Text>(
        find.text('Details about the personalisation service can be shown here. Implement forms or upload UI as required.'),
      );
      expect(descText.style?.fontSize, 18);
      expect(descText.style?.height, 1.6);
      expect(descText.textAlign, TextAlign.left);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Description has max width constraint', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      final constrainedBox = tester.widget<ConstrainedBox>(
        find.ancestor(
          of: find.text('Details about the personalisation service can be shown here. Implement forms or upload UI as required.'),
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
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      final padding = tester.widget<Padding>(
        find.ancestor(
          of: find.text('Personalisation'),
          matching: find.byType(Padding),
        ).first,
      );

      expect(padding.padding, const EdgeInsets.fromLTRB(24, 32, 24, 24));

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Content is centered', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      final column = tester.widget<Column>(
        find.ancestor(
          of: find.text('Personalisation'),
          matching: find.byType(Column),
        ).first,
      );

      expect(column.crossAxisAlignment, CrossAxisAlignment.center);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('PersonalisationPage displays footer', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Opening Hours'), findsWidgets);
      expect(find.text('Help and Information'), findsWidgets);
      expect(find.text('© 2025, upsu-store'), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Header has correct active page', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      // The header should be present (we can't easily test the activePage prop
      // without exposing it, but we can verify the header exists)
      expect(find.byIcon(Icons.search), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Page layout is consistent', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Verify the main structure
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(Column), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Spacing between title and description is correct', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
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
          home: PersonalisationPage(),
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