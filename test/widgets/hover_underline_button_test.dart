import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/hover_underline_button.dart';

void main() {
  group('HoverUnderlineButton Tests', () {
    testWidgets('Button renders with text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              text: 'Home',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.byType(HoverUnderlineButton), findsOneWidget);
    });

    testWidgets('Button displays correct text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              text: 'Shop',
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
              text: 'Click Me',
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
              text: 'Active',
              isActive: true,
              onPressed: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );

      expect(container.constraints?.maxHeight, 2);
    });

    testWidgets('Inactive button has no underline width', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              text: 'Inactive',
              isActive: false,
              onPressed: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );

      expect(container.constraints?.maxWidth ?? double.infinity, 0);
    });

    testWidgets('Active button has bold text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              text: 'Active',
              isActive: true,
              onPressed: () {},
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Active'));
      
      expect(text.style?.fontWeight, FontWeight.bold);
      expect(text.style?.color, const Color(0xFF4d2963));
    });

    testWidgets('Inactive button has normal text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              text: 'Inactive',
              isActive: false,
              onPressed: () {},
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Inactive'));
      
      expect(text.style?.fontWeight, FontWeight.normal);
      expect(text.style?.color, Colors.black87);
    });

    testWidgets('Button has correct text styling', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              text: 'Styled',
              onPressed: () {},
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Styled'));
      
      expect(text.style?.fontSize, 14);
    });

    testWidgets('Button triggers callback only once per tap', (WidgetTester tester) async {
      int pressCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              text: 'Press Me',
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
              text: 'Counter',
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
                  text: 'Home',
                  onPressed: () {},
                ),
                HoverUnderlineButton(
                  text: 'Shop',
                  onPressed: () {},
                ),
                HoverUnderlineButton(
                  text: 'About',
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
              text: 'Animated',
              onPressed: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      
      expect(container.duration, const Duration(milliseconds: 200));
    });

    testWidgets('Active and inactive buttons display correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                HoverUnderlineButton(
                  text: 'Active Button',
                  isActive: true,
                  onPressed: () {},
                ),
                HoverUnderlineButton(
                  text: 'Inactive Button',
                  isActive: false,
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

    testWidgets('Button default isActive state is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              text: 'Default',
              onPressed: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );

      expect(container.constraints?.maxWidth ?? double.infinity, 0);
    });

    testWidgets('Button has InkWell', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              text: 'Gesture',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(
        find.descendant(
          of: find.byType(HoverUnderlineButton),
          matching: find.byType(InkWell),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Button has MouseRegion', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              text: 'Mouse',
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

    testWidgets('Button has Column layout', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              text: 'Layout',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(
        find.descendant(
          of: find.byType(HoverUnderlineButton),
          matching: find.byType(Column),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Underline container has correct color', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HoverUnderlineButton(
              text: 'Active',
              isActive: true,
              onPressed: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );

      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.color, const Color(0xFF4d2963));
    });
  });
}