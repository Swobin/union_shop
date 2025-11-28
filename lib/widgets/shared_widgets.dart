import 'package:flutter/material.dart';

// Reusable header widget with logo and navigation
class AppHeader extends StatelessWidget {
  final String activePage;

  const AppHeader({super.key, required this.activePage});

  void _navigateTo(BuildContext context, String route) {
    if (ModalRoute.of(context)?.settings.name != route) {
      Navigator.pushNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 120,
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => _navigateTo(context, '/'),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                          height: 44,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              width: 44,
                              height: 44,
                              child: const Center(
                                child: Icon(Icons.image_not_supported, color: Colors.grey),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  HoverUnderlineButton(
                    label: 'Home',
                    onPressed: () => _navigateTo(context, '/'),
                    active: activePage == 'home',
                  ),
                  const SizedBox(width: 16),
                  HoverUnderlineButton(
                    label: 'Shop',
                    onPressed: () => _navigateTo(context, '/product'),
                    active: activePage == 'shop',
                  ),
                  const SizedBox(width: 16),
                  HoverUnderlineButton(
                    label: 'The Print Shack',
                    onPressed: () => _navigateTo(context, '/print-shack-about'),
                    active: activePage == 'print-shack',
                  ),
                  const SizedBox(width: 16),
                  HoverUnderlineButton(
                    label: 'SALE!',
                    onPressed: () => _navigateTo(context, '/sale'),
                    active: activePage == 'sale',
                  ),
                  const SizedBox(width: 16),
                  HoverUnderlineButton(
                    label: 'About',
                    onPressed: () => _navigateTo(context, '/about'),
                    active: activePage == 'about',
                  ),
                  const Spacer(),
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
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable footer widget
class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.grey[50],
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Opening Hours
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Opening Hours',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Help and Information',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                    const Text('Latest Offers',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                              child: Text('Email address',
                                  style: TextStyle(color: Colors.black54)),
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
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold)),
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
    );
  }
}

// Hover underline button widget
class HoverUnderlineButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final bool active;

  const HoverUnderlineButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.active = false,
  });

  @override
  State<HoverUnderlineButton> createState() => _HoverUnderlineButtonState();
}

class _HoverUnderlineButtonState extends State<HoverUnderlineButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final bool showUnderline = _hovering || widget.active;
    final underlineColor =
        showUnderline ? const Color(0xFF4d2963) : Colors.transparent;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: underlineColor, width: 2),
            ),
          ),
          child: Text(
            widget.label,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.8,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}