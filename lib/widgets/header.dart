import 'package:flutter/material.dart';
import 'package:union_shop/widgets/hover_underline_button.dart';

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