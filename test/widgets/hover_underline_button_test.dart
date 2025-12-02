import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/hover_underline_button.dart';

void main() {
  group('HoverUnderlineButton Tests', () {
    testWidgets('Button renders with label', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              label: 'Home',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.byType(HoverUnderlineButton), findsOneWidget);
    });

    testWidgets('Button displays correct label', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              label: 'Shop',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Shop'), findsOneWidget);
    });

    testWidgets('Button can be tapped', (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              label: 'Click Me',
              onPressed: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Click Me'));
      await tester.pumpAndSettle();

      expect(wasPressed, true);
    });

    testWidgets('Active button shows underline', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              label: 'Active',
              active: true,
              onPressed: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );

      final decoration = container.decoration as BoxDecoration;
      final border = decoration.border as Border;
      
      expect(border.bottom.color, const Color(0xFF4d2963));
      expect(border.bottom.width, 2);
    });

    testWidgets('Inactive button has transparent underline', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              label: 'Inactive',
              active: false,
              onPressed: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );

      final decoration = container.decoration as BoxDecoration;
      final border = decoration.border as Border;
      
      expect(border.bottom.color, Colors.transparent);
    });

    testWidgets('Button has correct text styling', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              label: 'Styled',
              onPressed: () {},
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Styled'));
      
      expect(text.style?.fontFamily, 'Roboto');
      expect(text.style?.fontSize, 16);
      expect(text.style?.fontWeight, FontWeight.normal);
      expect(text.style?.letterSpacing, 0.8);
      expect(text.style?.color, Colors.black);
    });

    testWidgets('Button has correct padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              label: 'Padded',
              onPressed: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      
      expect(container.padding, const EdgeInsets.symmetric(horizontal: 16, vertical: 8));
    });

    testWidgets('Button has click cursor', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              label: 'Cursor',
              onPressed: () {},
            ),
          ),
        ),
      );

      // Find the MouseRegion that's a descendant of HoverUnderlineButton
      final mouseRegion = tester.widget<MouseRegion>(
        find.descendant(
          of: find.byType(HoverUnderlineButton),
          matching: find.byType(MouseRegion),
        ),
      );
      
      expect(mouseRegion.cursor, SystemMouseCursors.click);
    });

    testWidgets('Button triggers callback only once per tap', (WidgetTester tester) async {
      int pressCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              label: 'Press Me',
              onPressed: () {
                pressCount++;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Press Me'));
      await tester.pumpAndSettle();

      expect(pressCount, 1);
    });

    testWidgets('Button can be tapped multiple times', (WidgetTester tester) async {
      int pressCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              label: 'Counter',
              onPressed: () {
                pressCount++;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Counter'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Counter'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Counter'));
      await tester.pumpAndSettle();

      expect(pressCount, 3);
    });

    testWidgets('Multiple buttons can be rendered', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              children: [
                HoverUnderlineButton(
                  label: 'Home',
                  onPressed: () {},
                ),
                HoverUnderlineButton(
                  label: 'Shop',
                  onPressed: () {},
                ),
                HoverUnderlineButton(
                  label: 'About',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Shop'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
      expect(find.byType(HoverUnderlineButton), findsNWidgets(3));
    });

    testWidgets('AnimatedContainer has correct duration', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              label: 'Animated',
              onPressed: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      
      expect(container.duration, const Duration(milliseconds: 150));
    });

    testWidgets('Active and inactive buttons display correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                HoverUnderlineButton(
                  label: 'Active Button',
                  active: true,
                  onPressed: () {},
                ),
                HoverUnderlineButton(
                  label: 'Inactive Button',
                  active: false,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Active Button'), findsOneWidget);
      expect(find.text('Inactive Button'), findsOneWidget);
      expect(find.byType(HoverUnderlineButton), findsNWidgets(2));
    });

    testWidgets('Button default active state is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              label: 'Default',
              onPressed: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );

      final decoration = container.decoration as BoxDecoration;
      final border = decoration.border as Border;
      
      // Should be transparent when not active and not hovering
      expect(border.bottom.color, Colors.transparent);
    });

    testWidgets('Button has GestureDetector', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              label: 'Gesture',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(
        find.descendant(
          of: find.byType(HoverUnderlineButton),
          matching: find.byType(GestureDetector),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Button has MouseRegion', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              label: 'Mouse',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(
        find.descendant(
          of: find.byType(HoverUnderlineButton),
          matching: find.byType(MouseRegion),
        ),
        findsOneWidget,
      );
    });
  });
}