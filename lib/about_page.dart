import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  void _navigateTo(BuildContext context, String route) {
    if (ModalRoute.of(context)?.settings.name != route) {
      Navigator.pushNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a Column so header stays at top and content scrolls below
      body: Column(
        children: [
          // Header (purple banner + white header row with logo and buttons)
          Container(
            color: Colors.white,
            height: 120,
            child: Column(
              children: [
                // Top purple banner
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
                // Main header row
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Union logo
                        GestureDetector(
                          onTap: () => _navigateTo(context, '/'),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                              height: 44,
                              fit: BoxFit.contain,
                              errorBuilder: (context, _, __) {
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
                        // Center navigation buttons
                        HoverUnderlineButton(
                          label: 'Home',
                          onPressed: () => _navigateTo(context, '/'),
                          active: false,
                        ),
                        const SizedBox(width: 16),
                        HoverUnderlineButton(
                          label: 'Shop',
                          onPressed: () => _navigateTo(context, '/product'),
                          active: false,
                        ),
                        const SizedBox(width: 16),
                        HoverUnderlineButton(
                          label: 'The Print Shack',
                          onPressed: () => _navigateTo(context, '/'),
                          active: false,
                        ),
                        const SizedBox(width: 16),
                        HoverUnderlineButton(
                          label: 'SALE!',
                          onPressed: () => _navigateTo(context, '/'),
                          active: false,
                        ),
                        const SizedBox(width: 16),
                        HoverUnderlineButton(
                          label: 'About',
                          onPressed: () {}, // already here
                          active: true, // keep underline on this page
                        ),
                        const Spacer(),
                        // Right-side icons (optional)
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
                        IconButton(
                          icon: const Icon(Icons.menu, size: 18, color: Colors.grey),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Page content — moved up and larger title
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      'About us',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // keep the content block centered on the page, but left-align the paragraph inside a constrained width
                    Align(
                      alignment: Alignment.center,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 720),
                        child: const Text(
                          """Welcome to the Union Shop!

We’re dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round! We even offer an exclusive personalisation service!

All online purchases are available for delivery or instore collection!

We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don’t hesitate to contact us at hello@upsu.net.

Happy shopping!

The Union Shop & Reception Team​​​​​​​​​""",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Local copy of the hover-underline button used in main.dart (keeps behaviour consistent)
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
    final underlineColor = showUnderline ? const Color(0xFF4d2963) : Colors.transparent;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
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