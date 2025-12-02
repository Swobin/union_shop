import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/header.dart';

class PersonalisationPage extends StatelessWidget {
  const PersonalisationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(activePage: 'print-shack'),

            // Page content
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Personalisation',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 720),
                    child: const Text(
                      'Details about the personalisation service can be shown here. Implement forms or upload UI as required.',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 18, height: 1.6),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),

            const AppFooter(),
          ],
        ),
      ),
    );
  }
}