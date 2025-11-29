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

  // Mobile dropdown menu positioned to the right
  void _showMobileMenu(BuildContext context, BuildContext buttonContext) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Transparent barrier to close menu when tapping outside
          Positioned.fill(
            child: GestureDetector(
              onTap: () => overlayEntry.remove(),
              child: Container(color: Colors.transparent),
            ),
          ),
          // Menu positioned on top right
          Positioned(
            top: 120,
            right: 20,
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 250,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height - 140,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: const Text('Home'),
                        onTap: () {
                          overlayEntry.remove();
                          _navigateTo(context, '/');
                        },
                      ),
                      const Divider(height: 1),

                      // Shop with expansion
                      ExpansionTile(
                        title: const Text('Shop'),
                        children: [
                          'Clothing',
                          'Merchandise',
                          'Halloween',
                          'Signature & Essential Range',
                          'Portsmouth City Collection',
                          'Pride Collection',
                          'Graduation',
                        ]
                            .map((category) => ListTile(
                                  dense: true,
                                  title: Text(category, style: const TextStyle(fontSize: 14)),
                                  onTap: () {
                                    overlayEntry.remove();
                                    // Add category navigation here
                                  },
                                ))
                            .toList(),
                      ),
                      const Divider(height: 1),

                      // The Print Shack with expansion
                      ExpansionTile(
                        title: const Text('The Print Shack'),
                        children: [
                          ListTile(
                            dense: true,
                            title: const Text('About', style: TextStyle(fontSize: 14)),
                            onTap: () {
                              overlayEntry.remove();
                              _navigateTo(context, '/print-shack-about');
                            },
                          ),
                          ListTile(
                            dense: true,
                            title: const Text('Personalisation', style: TextStyle(fontSize: 14)),
                            onTap: () {
                              overlayEntry.remove();
                              _navigateTo(context, '/personalisation');
                            },
                          ),
                        ],
                      ),
                      const Divider(height: 1),

                      ListTile(
                        title: const Text('SALE!'),
                        onTap: () {
                          overlayEntry.remove();
                          _navigateTo(context, '/sale');
                        },
                      ),
                      const Divider(height: 1),

                      ListTile(
                        title: const Text('About'),
                        onTap: () {
                          overlayEntry.remove();
                          _navigateTo(context, '/about');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    overlay.insert(overlayEntry);
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

                  // Responsive navigation: full buttons on wide, hidden on mobile
                  Builder(builder: (navCtx) {
                    final isWide = MediaQuery.of(navCtx).size.width > 760;
                    if (isWide) {
                      // Desktop/tablet view - show all buttons
                      return Row(
                        children: [
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
                        ],
                      );
                    } else {
                      // Mobile view - show nothing here (menu will be on the right)
                      return const SizedBox.shrink();
                    }
                  }),

                  const Spacer(),

                  // Right side icons (always visible)
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

                  // Mobile hamburger menu (only on small screens, appears after shopping bag)
                  Builder(builder: (buttonCtx) {
                    final isMobile = MediaQuery.of(buttonCtx).size.width <= 760;
                    if (isMobile) {
                      return IconButton(
                        icon: const Icon(Icons.menu, size: 24, color: Colors.grey),
                        onPressed: () => _showMobileMenu(context, buttonCtx),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}