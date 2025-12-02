import 'package:flutter/material.dart';

// Reusable header widget with logo and navigation
class AppHeader extends StatelessWidget {
  final String activePage;

  const AppHeader({super.key, required this.activePage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo with Image
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/'),
            child: Row(
              children: [
                Image.network(
                  'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                  height: 50,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text(
                      'UNION SHOP',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4d2963),
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const SizedBox(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Navigation Links
          Row(
            children: [
              _buildNavButton(
                context,
                'Home',
                activePage == '',
                () => Navigator.pushNamed(context, '/'),
              ),
              const SizedBox(width: 24),
              _buildDropdownMenu(
                context,
                'Shop',
                activePage == 'collections',
                [
                  {'label': 'Clothing', 'route': '/collections'},
                  {'label': 'Merchandise', 'route': '/collections'},
                  {'label': 'Halloween', 'route': '/collections'},
                  {'label': 'Signature & Essential Range', 'route': '/essential-range'},
                  {'label': 'Portsmouth City Collection', 'route': '/collections'},
                  {'label': 'Pride Collection', 'route': '/collections'},
                  {'label': 'Graduation', 'route': '/collections'},
                ],
              ),
              const SizedBox(width: 24),
              _buildDropdownMenu(
                context,
                'The Print Shack',
                activePage == 'print-shack',
                [
                  {'label': 'About', 'route': '/print-shack-about'},
                  {'label': 'Personalisation', 'route': '/personalisation'},
                ],
              ),
              const SizedBox(width: 24),
              _buildNavButton(
                context,
                'SALE!',
                activePage == 'sale',
                () => Navigator.pushNamed(context, '/sale'),
              ),
              const SizedBox(width: 24),
              _buildNavButton(
                context,
                'About',
                activePage == 'about',
                () {
                  // Navigate to about page when created
                },
              ),
            ],
          ),
          // Icons
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // Search functionality
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  // User account
                },
                icon: const Icon(Icons.person_outline),
              ),
              IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart'),
                icon: const Icon(Icons.shopping_bag_outlined),
                tooltip: 'Cart',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(
    BuildContext context,
    String text,
    bool isActive,
    VoidCallback onPressed,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? const Color(0xFF4d2963) : Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownMenu(
    BuildContext context,
    String text,
    bool isActive,
    List<Map<String, String>> items,
  ) {
    return PopupMenuButton<String>(
      offset: const Offset(0, 40),
      onSelected: (String route) {
        Navigator.pushNamed(context, route);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                color: isActive ? const Color(0xFF4d2963) : Colors.black87,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.arrow_drop_down,
              size: 20,
              color: isActive ? const Color(0xFF4d2963) : Colors.black87,
            ),
          ],
        ),
      ),
      itemBuilder: (BuildContext context) {
        return items.map((item) {
          return PopupMenuItem<String>(
            value: item['route'],
            child: Text(item['label']!),
          );
        }).toList();
      },
    );
  }
}