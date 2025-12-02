import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/header.dart';

class PrintShackAboutPage extends StatelessWidget {
  const PrintShackAboutPage({super.key});

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
                    'The Print Shack',
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
                      """Welcome to The Print Shack!

Our personalisation service allows you to customize your Union Shop products with your own designs, text, and graphics.

Services we offer:
• Custom embroidery
• Screen printing
• Heat transfer printing
• Vinyl cutting
• Custom badges and patches

Whether you're looking to personalize a single item or create custom merchandise for your society or sports team, we've got you covered!

For bulk orders and society enquiries, please contact us at printshack@upsu.net.

Let's make something unique together!

The Print Shack Team""",
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