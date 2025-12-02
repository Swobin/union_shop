import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/auth_page.dart';

void main() {
  group('Auth Page Tests', () {
    testWidgets('AuthPage renders without errors', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(AuthPage), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AuthPage displays header', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsWidgets);
      expect(find.byIcon(Icons.search), findsWidgets);
      expect(find.byIcon(Icons.person_outline), findsWidgets);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AuthPage displays "Sign In" title by default', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Sign In'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AuthPage has white background', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, Colors.white);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AuthPage is scrollable', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AuthPage displays toggle buttons', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('SIGN IN'), findsWidgets);
      expect(find.text('SIGN UP'), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AuthPage shows login form by default', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Remember me'), findsOneWidget);
      expect(find.text('Forgot password?'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AuthPage can switch to signup form', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('SIGN UP').first);
      await tester.pumpAndSettle();

      expect(find.text('Create Account'), findsOneWidget);
      expect(find.text('Full Name'), findsOneWidget);
      expect(find.text('Confirm Password'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AuthPage can switch back to login form', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('SIGN UP').first);
      await tester.pumpAndSettle();

      await tester.tap(find.text('SIGN IN').first);
      await tester.pumpAndSettle();

      expect(find.text('Sign In'), findsOneWidget);
      expect(find.text('Remember me'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Login form has email field with validation', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      final emailField = find.widgetWithText(TextFormField, 'Enter your email');
      expect(emailField, findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Login form has password field with visibility toggle', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      final passwordField = find.widgetWithText(TextFormField, 'Enter your password');
      expect(passwordField, findsOneWidget);
      expect(find.byIcon(Icons.visibility_off), findsAtLeastNWidgets(1));

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Login form can toggle password visibility', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      final visibilityToggle = find.byIcon(Icons.visibility_off).first;
      await tester.tap(visibilityToggle);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.visibility), findsAtLeastNWidgets(1));

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Login form has remember me checkbox', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Checkbox), findsWidgets);
      expect(find.text('Remember me'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Remember me checkbox can be toggled', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      final checkbox = find.byType(Checkbox).first;
      await tester.tap(checkbox);
      await tester.pumpAndSettle();

      final checkboxWidget = tester.widget<Checkbox>(checkbox);
      expect(checkboxWidget.value, true);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Login form has forgot password button', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Forgot password?'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Signup form has all required fields', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('SIGN UP').first);
      await tester.pumpAndSettle();

      expect(find.text('Full Name'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Confirm Password'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Signup form has terms and conditions checkbox', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('SIGN UP').first);
      await tester.pumpAndSettle();

      expect(find.textContaining('Terms & Conditions'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Signup button is disabled when terms not accepted', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('SIGN UP').first);
      await tester.pumpAndSettle();

      final button = find.widgetWithText(ElevatedButton, 'CREATE ACCOUNT');
      final elevatedButton = tester.widget<ElevatedButton>(button);
      expect(elevatedButton.onPressed, isNull);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Signup button is enabled when terms accepted', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('SIGN UP').first);
      await tester.pumpAndSettle();

      final termsCheckbox = find.byType(Checkbox).first;
      await tester.tap(termsCheckbox);
      await tester.pumpAndSettle();

      final button = find.widgetWithText(ElevatedButton, 'CREATE ACCOUNT');
      final elevatedButton = tester.widget<ElevatedButton>(button);
      expect(elevatedButton.onPressed, isNotNull);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AuthPage displays OR divider', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('OR'), findsOneWidget);
      expect(find.byType(Divider), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AuthPage displays social login buttons', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Continue with Google'), findsOneWidget);
      expect(find.text('Continue with Facebook'), findsOneWidget);
      expect(find.text('Continue with Apple'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Social login buttons have correct icons', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.facebook), findsWidgets);
      expect(find.byIcon(Icons.apple), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Social login buttons can be tapped', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Continue with Google'));
      await tester.pumpAndSettle();

      expect(find.text('Google login coming soon!'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Login button shows snackbar when tapped', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Enter valid email and password
      await tester.enterText(find.widgetWithText(TextFormField, 'Enter your email'), 'test@example.com');
      await tester.enterText(find.widgetWithText(TextFormField, 'Enter your password'), 'password123');
      
      await tester.tap(find.widgetWithText(ElevatedButton, 'SIGN IN'));
      await tester.pumpAndSettle();

      expect(find.text('Login functionality coming soon!'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('Forgot password button shows snackbar', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Forgot password?'));
      await tester.pumpAndSettle();

      expect(find.text('Password recovery coming soon!'), findsOneWidget);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AuthPage displays footer', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Opening Hours'), findsWidgets);
      expect(find.text('Help and Information'), findsWidgets);
      expect(find.text('© 2025, upsu-store'), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('AuthPage form has max width constraint', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: AuthPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ConstrainedBox), findsWidgets);

      await tester.binding.setSurfaceSize(null);
    });
  });
}