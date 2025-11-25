import 'package:flutter/material.dart';

class PrintShackAboutPage extends StatelessWidget {
  const PrintShackAboutPage({super.key});

  void _goHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header (top banner + white header row)
            Container(
              height: 120,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: const Color(0xFF4d2963),
                    child: const Text(
                      'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF COME GRAB YOURS WHILE STOCK LASTS!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => _goHome(context),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                                  height: 44,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),

                          // simple nav buttons (visual parity with Home)
                          TextButton(onPressed: () => Navigator.pushNamed(context, '/'), child: const Text('Home')),
                          const SizedBox(width: 12),
                          TextButton(
                              onPressed: () => Navigator.pushNamed(context, '/product'), child: const Text('Shop')),
                          const SizedBox(width: 12),
                          // The Print Shack menu can be handled elsewhere; here we show the label
                          TextButton(onPressed: () {}, child: const Text('The Print Shack')),
                          const SizedBox(width: 12),
                          TextButton(onPressed: () => Navigator.pushNamed(context, '/'), child: const Text('SALE!')),
                          const SizedBox(width: 12),
                          TextButton(
                              onPressed: () => Navigator.pushNamed(context, '/about'), child: const Text('About')),

                          const Spacer(),

                          // right side icons
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.search, size: 18, color: Colors.grey),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.person_outline, size: 18, color: Colors.grey),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.shopping_bag_outlined, size: 18, color: Colors.grey),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Page content
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'The Print Shack — About',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 720),
                    child: const Text(
                      'This is the Print Shack About page. Add specific information about The Print Shack here.',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),

            // Footer (same structure as HomeScreen)
            Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.grey[50],
                  padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Opening Hours
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Opening Hours', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            SizedBox(height: 12),
                            Text(
                              '''❄️ Winter Break Closure Dates ❄️

Closing 4pm 19/12/2025

Reopening 10am 05/01/2026

Last post date: 12pm on 18/12/2025
------------------------
(Term Time)

Monday - Friday 10am - 4pm

(Outside of Term Time / Consolidation
Weeks)

Monday - Friday 10am - 3pm

Purchase online 24/7''',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),

                      // Help & Information
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Help and Information', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            SizedBox(height: 12),
                            Text('Search'),
                            SizedBox(height: 6),
                            Text('Terms & Conditions of Sale'),
                            SizedBox(height: 6),
                            Text('Policy'),
                          ],
                        ),
                      ),

                      // Latest Offers / Newsletter
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Latest Offers', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Email address', style: TextStyle(color: Colors.black54)),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  height: 40,
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  color: const Color(0xFF4d2963),
                                  alignment: Alignment.center,
                                  child: const Text('SUBSCRIBE',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 36,
                              height: 36,
                              color: Colors.grey.shade200,
                              child: const Icon(Icons.facebook, size: 18)),
                          const SizedBox(width: 12),
                          Container(
                              width: 36,
                              height: 36,
                              color: Colors.grey.shade200,
                              child: const Icon(Icons.share, size: 18)),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Container(width: 40, height: 24, color: Colors.grey.shade100),
                          const SizedBox(width: 8),
                          Container(width: 40, height: 24, color: Colors.grey.shade100),
                          const SizedBox(width: 8),
                          const Text('© 2025, upsu-store'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}