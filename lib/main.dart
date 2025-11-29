import 'package:flutter/material.dart';
import 'package:union_shop/views/product_page.dart';
import 'package:union_shop/views/about_page.dart';
import 'package:union_shop/views/print_shack_about.dart';
import 'package:union_shop/views/personalisation_page.dart';
import 'package:union_shop/views/sale_page.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutPage(),
        '/print-shack-about': (context) => const PrintShackAboutPage(),
        '/personalisation': (context) => const PersonalisationPage(),
        '/sale': (context) => const SalePage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // show a popup menu positioned under the Shop button (no new route)
  void showShopCategories(BuildContext context, BuildContext buttonContext) {
    final categories = <String>[
      'Clothing',
      'Merchandise',
      'Halloween',
      'Signature & Essential Range',
      'Portsmouth City Collection',
      'Pride Collection',
      'Graduation',
    ];

    // compute a RelativeRect that starts just below the Shop button so the menu does not cover it
    final RenderBox button = buttonContext.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    final Offset buttonTopLeft = button.localToGlobal(Offset.zero, ancestor: overlay);
    final Offset buttonBottomLeft = button.localToGlobal(Offset(0, button.size.height), ancestor: overlay);

    const double gap = 6.0;
    final double left = buttonTopLeft.dx;
    final double top = buttonBottomLeft.dy + gap;
    final double right = overlay.size.width - (left + button.size.width);
    final double bottom = overlay.size.height - top;

    final RelativeRect position = RelativeRect.fromLTRB(left, top, right, bottom);

    showMenu<String>(
      context: context,
      position: position,
      items: categories.map((c) {
        return PopupMenuItem<String>(
          value: c,
          // Removed the trailing chevron so only the label shows
          child: Text(c, style: const TextStyle(fontFamily: 'Roboto')),
        );
      }).toList(),
    ).then((selected) {
      if (selected != null) {
        // currently just close the menu. Add navigation/filtering here later.
      }
    });
  }

  // show a popup menu positioned under The Print Shack button
  void showPrintShackMenu(BuildContext context, BuildContext buttonContext) {
    final items = <String>['About', 'Personalisation'];

    final RenderBox button = buttonContext.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    final Offset buttonTopLeft = button.localToGlobal(Offset.zero, ancestor: overlay);
    final Offset buttonBottomLeft = button.localToGlobal(Offset(0, button.size.height), ancestor: overlay);

    const double gap = 6.0;
    final double left = buttonTopLeft.dx;
    final double top = buttonBottomLeft.dy + gap;
    final double right = overlay.size.width - (left + button.size.width);
    final double bottom = overlay.size.height - top;

    final RelativeRect position = RelativeRect.fromLTRB(left, top, right, bottom);

    showMenu<String>(
      context: context,
      position: position,
      items: items.map((label) {
        return PopupMenuItem<String>(
          value: label,
          child: Text(label, style: const TextStyle(fontFamily: 'Roboto')),
        );
      }).toList(),
    ).then((selected) {
      if (selected == null) return;
      if (selected == 'About') {
        Navigator.pushNamed(context, '/print-shack-about');
      } else if (selected == 'Personalisation') {
        Navigator.pushNamed(context, '/personalisation');
      }
    });
  }

  // New: mobile menu (used by hamburger on small screens)
  void showMobileMenu(BuildContext context) {
    final categories = <String>[
      'Clothing',
      'Merchandise',
      'Halloween',
      'Signature & Essential Range',
      'Portsmouth City Collection',
      'Pride Collection',
      'Graduation',
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // header bar for sheet
                  Row(
                    children: [
                      const Text('Menu', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(ctx),
                      ),
                    ],
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pop(ctx);
                      Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
                    },
                  ),

                  // Shop with expansion for categories
                  ExpansionTile(
                    title: const Text('Shop'),
                    children: categories
                        .map((c) => ListTile(
                              title: Text(c),
                              onTap: () {
                                Navigator.pop(ctx);
                                // Add navigation/filtering later; currently close sheet
                                // Navigator.pushNamed(context, '/product', arguments: c);
                              },
                            ))
                        .toList(),
                  ),

                  // The Print Shack submenu
                  ExpansionTile(
                    title: const Text('The Print Shack'),
                    children: [
                      ListTile(
                        title: const Text('About'),
                        onTap: () {
                          Navigator.pop(ctx);
                          Navigator.pushNamed(context, '/print-shack-about');
                        },
                      ),
                      ListTile(
                        title: const Text('Personalisation'),
                        onTap: () {
                          Navigator.pop(ctx);
                          Navigator.pushNamed(context, '/personalisation');
                        },
                      ),
                    ],
                  ),

                  ListTile(
                    title: const Text('SALE!'),
                    onTap: () {
                      Navigator.pop(ctx);
                      // Navigate to sale page or implement later
                    },
                  ),

                  ListTile(
                    title: const Text('About'),
                    onTap: () {
                      Navigator.pop(ctx);
                      Navigator.pushNamed(context, '/about');
                    },
                  ),

                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              height: 120,
              color: Colors.white,
              child: Column(
                children: [
                  // Top banner
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
                  // Main header
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                navigateToHome(context);
                              },
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

                          // Responsive navigation: full buttons on wide, single menu on narrow
                          Builder(builder: (navCtx) {
                            final isWide = MediaQuery.of(navCtx).size.width > 760;
                            if (isWide) {
                              return Row(
                                children: [
                                  HoverUnderlineButton(
                                    label: 'Home',
                                    onPressed: () => navigateToHome(context),
                                    active: true,
                                  ),
                                  const SizedBox(width: 16),
                                  Builder(builder: (buttonContext) {
                                    return HoverUnderlineButton(
                                      label: 'Shop ▾',
                                      onPressed: () => showShopCategories(context, buttonContext),
                                      active: false,
                                    );
                                  }),
                                  const SizedBox(width: 16),
                                  Builder(builder: (buttonContext) {
                                    return HoverUnderlineButton(
                                      label: 'The Print Shack ▾',
                                      onPressed: () => showPrintShackMenu(context, buttonContext),
                                      active: false,
                                    );
                                  }),
                                  const SizedBox(width: 16),
                                  HoverUnderlineButton(
                                    label: 'SALE!',
                                    onPressed: placeholderCallbackForButtons,
                                    active: false,
                                  ),
                                  const SizedBox(width: 16),
                                  HoverUnderlineButton(
                                    label: 'About',
                                    onPressed: () => Navigator.pushNamed(context, '/about'),
                                    active: false,
                                  ),
                                ],
                              );
                            } else {
                              // mobile: single hamburger that opens a full menu (includes shop categories & print shack)
                              return IconButton(
                                icon: const Icon(Icons.menu),
                                onPressed: () => showMobileMenu(context),
                              );
                            }
                          }),

                          const Spacer(),
                          // right-side icons -- keep on all sizes
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.search, size: 18, color: Colors.grey),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(Icons.person_outline, size: 18, color: Colors.grey),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(Icons.shopping_bag_outlined, size: 18, color: Colors.grey),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Hero Section
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/zip_up_hoodie.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  // Content overlay
                  Positioned(
                    left: 24,
                    right: 24,
                    top: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'ESSENTIAL RANGE - OVER 20% OFF',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Over 20% off our Essential Range. Come and grab yours while stock lasts!",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            height: 1.5,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () => Navigator.pushNamed(context, '/product'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            'BROWSE COLLECTION',
                            style: TextStyle(fontSize: 16, letterSpacing: 1.2, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Products Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'ESSENTIAL RANGE - OVER 20% OFF!',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // New two clickable pictures row
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final isWide = constraints.maxWidth > 640;
                        return isWide
                            ? Row(
                                children: [
                                  Expanded(
                                    child: HoverUnderlineImageTile(
                                      label: 'Limited Edition Essential Zip Hoodies',
                                      imageUrl: 'assets/images/zip_up_hoodie.png', // <-- updated
                                      oldPrice: '£20.00',
                                      newPrice: '£14.99',
                                      onTap: () => Navigator.pushNamed(context, '/product'),
                                    ),
                                  ),
                                  const SizedBox(width: 32),
                                  Expanded(
                                    child: HoverUnderlineImageTile(
                                      label: 'Essential T-Shirt',
                                      imageUrl:
                                          'assets/images/limited_t_shirt.png', // <-- changed to limited_t_shirt.png
                                      oldPrice: '£10.00',
                                      newPrice: '£6.99',
                                      onTap: () => Navigator.pushNamed(context, '/product'),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  HoverUnderlineImageTile(
                                    label: 'Limited Edition Essential Zip Hoodies',
                                    imageUrl: 'assets/images/zip_up_hoodie.png', // <-- updated
                                    oldPrice: '£20.00',
                                    newPrice: '£14.99',
                                    onTap: () => Navigator.pushNamed(context, '/product'),
                                  ),
                                  const SizedBox(height: 24),
                                  HoverUnderlineImageTile(
                                    label: 'Essential T-Shirt',
                                    imageUrl: 'assets/images/limited_t_shirt.png', // <-- changed to limited_t_shirt.png
                                    oldPrice: '£10.00',
                                    newPrice: '£6.99',
                                    onTap: () => Navigator.pushNamed(context, '/product'),
                                  ),
                                ],
                              );
                      },
                    ),

                    // Signature Range title + two clickable pictures
                    const SizedBox(height: 32),
                    const Text(
                      'Signature Range',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 24),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final isWide = constraints.maxWidth > 640;
                        return isWide
                            ? Row(
                                children: [
                                  Expanded(
                                    child: HoverUnderlineImageTile(
                                      label: 'Signature Hoodie',
                                      imageUrl:
                                          'assets/images/zip_up_hoodie.png',
                                      newPrice: '£32.99', // added price (no discount)
                                      onTap: () => Navigator.pushNamed(context, '/product'),
                                    ),
                                  ),
                                  const SizedBox(width: 32),
                                  Expanded(
                                    child: HoverUnderlineImageTile(
                                      label: 'Signature T-Shirt',
                                      imageUrl:
                                          'assets/images/signature_t_shirt.png', // <-- changed to signature_t_shirt.png
                                      newPrice: '£14.99', // added price (no discount)
                                      onTap: () => Navigator.pushNamed(context, '/product'),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  HoverUnderlineImageTile(
                                    label: 'Signature Hoodie',
                                    imageUrl: 'assets/images/zip_up_hoodie.png',
                                    newPrice: '£32.99',
                                    onTap: () => Navigator.pushNamed(context, '/product'),
                                  ),
                                  const SizedBox(height: 24),
                                  HoverUnderlineImageTile(
                                    label: 'Signature T-Shirt',
                                    imageUrl:
                                        'assets/images/signature_t_shirt.png', // <-- changed to signature_t_shirt.png
                                    newPrice: '£14.99',
                                    onTap: () => Navigator.pushNamed(context, '/product'),
                                  ),
                                ],
                              );
                      },
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: const [
                        ProductCard(
                          title: 'Placeholder Product 1',
                          price: '£10.00',
                          imageUrl: 'assets/images/zip_up_hoodie.png', // <-- updated
                        ),
                        ProductCard(
                          title: 'Placeholder Product 2',
                          price: '£15.00',
                          imageUrl: 'assets/images/zip_up_hoodie.png', // <-- updated
                        ),
                        ProductCard(
                          title: 'Placeholder Product 3',
                          price: '£20.00',
                          imageUrl: 'assets/images/zip_up_hoodie.png', // <-- updated
                        ),
                        ProductCard(
                          title: 'Placeholder Product 4',
                          price: '£25.00',
                          imageUrl: 'assets/images/zip_up_hoodie.png', // <-- updated
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Footer (fixed: non-const Row and concrete placeholders)
            Column(
              children: [
                // Upper footer (columns, newsletter, etc.)
                Container(
                  width: double.infinity,
                  color: Colors.grey[50],
                  padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Opening Hours column (single multiline Text instead of many Text widgets)
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
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),

                      // Help & Information column
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

                      // Latest Offers / Newsletter column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Latest Offers', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            const SizedBox(height: 12),
                            // simple email input + subscribe button visual
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey.shade300),
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
                                  child: const Text(
                                    'SUBSCRIBE',
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Divider between sections
                const Divider(height: 1),

                // Lower sub-footer (icons + payment badges + copyright)
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: Row(
                    children: [
                      // left: social icons (placeholders)
                      Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            color: Colors.grey.shade200,
                            child: const Icon(Icons.facebook, size: 18),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            width: 36,
                            height: 36,
                            color: Colors.grey.shade200,
                            child: const Icon(Icons.share, size: 18),
                          ),
                        ],
                      ),

                      const Spacer(),

                      // right: payment badges placeholders
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

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                maxLines: 2,
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HoverUnderlineButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final bool active; // new

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
    final underlineColor = showUnderline ? const Color(0xFF4d2963) : Colors.transparent;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // reduced (was 24,12)
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: underlineColor, width: 2),
            ),
          ),
          child: Text(
            widget.label,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14, // was 16
              fontWeight: FontWeight.normal,
              letterSpacing: 0.8, // slight reduction
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class HoverUnderlineImageTile extends StatefulWidget {
  final String label;
  final String imageUrl;
  final VoidCallback onTap;
  final String? oldPrice;
  final String? newPrice;
  const HoverUnderlineImageTile({
    super.key,
    required this.label,
    required this.imageUrl,
    required this.onTap,
    this.oldPrice,
    this.newPrice,
  });

  @override
  State<HoverUnderlineImageTile> createState() => _HoverUnderlineImageTileState();
}

class _HoverUnderlineImageTileState extends State<HoverUnderlineImageTile> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final underlineColor = (_hovering) ? const Color(0xFF4d2963) : Colors.transparent;

    // choose AssetImage for local assets, NetworkImage otherwise
    final ImageProvider<Object> imageProvider = widget.imageUrl.startsWith('assets/')
        ? AssetImage(widget.imageUrl) as ImageProvider<Object>
        : NetworkImage(widget.imageUrl) as ImageProvider<Object>;

    return MouseRegion(
        onEnter: (_) => setState(() => _hovering = true),
        onExit: (_) => setState(() => _hovering = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                // Use a Stack: static Image + animated overlay for brightness (no AnimatedContainer on decoration)
                child: ClipRect(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[200],
                            child: const Center(
                              child: Icon(Icons.image_not_supported, color: Colors.grey),
                            ),
                          );
                        },
                      ),
                      // Brighten overlay on hover using AnimatedOpacity (smooth, doesn't rebuild image)
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 150),
                        opacity: _hovering ? 0.18 : 0.0,
                        child: Container(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: underlineColor, width: 2),
                  ),
                ),
                padding: const EdgeInsets.only(bottom: 4),
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
              // Price rendering: supports (old + new) or single price (newPrice)
              if (widget.newPrice != null && widget.oldPrice != null) ...[
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      widget.oldPrice!,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.newPrice!,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4d2963),
                      ),
                    ),
                  ],
                ),
              ] else if (widget.newPrice != null) ...[
                const SizedBox(height: 6),
                Text(
                  widget.newPrice!,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4d2963),
                  ),
                ),
              ],
            ],
          ),
        ));
  }
}
