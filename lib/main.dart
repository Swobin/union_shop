import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/about_page.dart';

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
      home: const HomeScreen(),
      initialRoute: '/',
      routes: {
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              height: 120, // increased from 100
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
                      padding: const EdgeInsets.symmetric(horizontal: 24), // was 10
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              navigateToHome(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                                height: 44, // slightly smaller
                                fit: BoxFit.contain, // preserves aspect ratio
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
                          const Spacer(),
                          HoverUnderlineButton(
                            label: 'Home',
                            onPressed: () => navigateToHome(context),
                            active: true,
                          ),
                          const SizedBox(width: 16), // was 24
                          HoverUnderlineButton(
                            label: 'Shop',
                            onPressed: () => navigateToProduct(context),
                            active: false,
                          ),
                          const SizedBox(width: 16), // was 24
                          HoverUnderlineButton(
                            label: 'The Print Shack',
                            onPressed: placeholderCallbackForButtons,
                            active: false,
                          ),
                          const SizedBox(width: 16), // was 24
                          HoverUnderlineButton(
                            label: 'SALE!',
                            onPressed: placeholderCallbackForButtons,
                            active: false,
                          ),
                          const SizedBox(width: 16), // was 24
                          HoverUnderlineButton(
                            label: 'About',
                            onPressed: () => Navigator.pushNamed(context, '/about'),
                            active: false,
                          ),
                          const Spacer(),
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
                                IconButton(
                                  icon: const Icon(Icons.menu, size: 18, color: Colors.grey),
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
                            'assets/images/zip_up_hoodie.png', // changed from limited_zip_hoodie.jpg
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
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
                          'Placeholder Hero Title',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "This is placeholder text for the hero section.",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: placeholderCallbackForButtons,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            'BROWSE PRODUCTS',
                            style: TextStyle(fontSize: 14, letterSpacing: 1),
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
                                          'assets/images/zip_up_hoodie.png', // changed from limited_zip_hoodie.jpg
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

            // Footer
            Container(
              width: double.infinity,
              color: Colors.grey[50],
              padding: const EdgeInsets.all(24),
              child: const Text(
                'Placeholder Footer',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
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
