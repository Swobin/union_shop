import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/footer.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(activePage: 'shop'),

            // Page title banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              color: Colors.grey[100],
              child: const Text(
                'Shop All Collections',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),

            // Products content
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Essential Range Section
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
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isWide = constraints.maxWidth > 640;
                      return isWide
                          ? Row(
                              children: [
                                Expanded(
                                  child: _ProductTile(
                                    label: 'Limited Edition Essential Zip Hoodies',
                                    imageUrl: 'assets/images/zip_up_hoodie.png',
                                    oldPrice: '£20.00',
                                    newPrice: '£14.99',
                                    onTap: () => Navigator.pushNamed(context, '/essential-range'),
                                  ),
                                ),
                                const SizedBox(width: 32),
                                Expanded(
                                  child: _ProductTile(
                                    label: 'Essential T-Shirt',
                                    imageUrl: 'assets/images/limited_t_shirt.png',
                                    oldPrice: '£10.00',
                                    newPrice: '£6.99',
                                    onTap: () => Navigator.pushNamed(context, '/essential-range'),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                _ProductTile(
                                  label: 'Limited Edition Essential Zip Hoodies',
                                  imageUrl: 'assets/images/zip_up_hoodie.png',
                                  oldPrice: '£20.00',
                                  newPrice: '£14.99',
                                  onTap: () => Navigator.pushNamed(context, '/essential-range'),
                                ),
                                const SizedBox(height: 24),
                                _ProductTile(
                                  label: 'Essential T-Shirt',
                                  imageUrl: 'assets/images/limited_t_shirt.png',
                                  oldPrice: '£10.00',
                                  newPrice: '£6.99',
                                  onTap: () => Navigator.pushNamed(context, '/essential-range'),
                                ),
                              ],
                            );
                    },
                  ),

                  const SizedBox(height: 48),

                  // Signature Range Section
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
                                  child: _ProductTile(
                                    label: 'Signature Hoodie',
                                    imageUrl: 'assets/images/zip_up_hoodie.png',
                                    newPrice: '£32.99',
                                    onTap: () => Navigator.pushNamed(context, '/product-detail'),
                                  ),
                                ),
                                const SizedBox(width: 32),
                                Expanded(
                                  child: _ProductTile(
                                    label: 'Signature T-Shirt',
                                    imageUrl: 'assets/images/signature_t_shirt.png',
                                    newPrice: '£14.99',
                                    onTap: () => Navigator.pushNamed(context, '/product-detail'),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                _ProductTile(
                                  label: 'Signature Hoodie',
                                  imageUrl: 'assets/images/zip_up_hoodie.png',
                                  newPrice: '£32.99',
                                  onTap: () => Navigator.pushNamed(context, '/product-detail'),
                                ),
                                const SizedBox(height: 24),
                                _ProductTile(
                                  label: 'Signature T-Shirt',
                                  imageUrl: 'assets/images/signature_t_shirt.png',
                                  newPrice: '£14.99',
                                  onTap: () => Navigator.pushNamed(context, '/product-detail'),
                                ),
                              ],
                            );
                    },
                  ),

                  const SizedBox(height: 48),

                  // Portsmouth City Collection Section
                  const Text(
                    'Portsmouth City Collection',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 24),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 0.8,
                    children: [
                      _ProductCard(
                        title: 'Portsmouth City Hoodie',
                        price: '£29.99',
                        imageUrl: 'assets/images/zip_up_hoodie.png',
                        onTap: () => Navigator.pushNamed(context, '/product-detail'),
                      ),
                      _ProductCard(
                        title: 'Portsmouth City T-Shirt',
                        price: '£12.99',
                        imageUrl: 'assets/images/zip_up_hoodie.png',
                        onTap: () => Navigator.pushNamed(context, '/product-detail'),
                      ),
                      _ProductCard(
                        title: 'Portsmouth City Cap',
                        price: '£9.99',
                        imageUrl: 'assets/images/zip_up_hoodie.png',
                        onTap: () => Navigator.pushNamed(context, '/product-detail'),
                      ),
                      _ProductCard(
                        title: 'Portsmouth City Tote Bag',
                        price: '£7.99',
                        imageUrl: 'assets/images/zip_up_hoodie.png',
                        onTap: () => Navigator.pushNamed(context, '/product-detail'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/collection'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4d2963),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: const Text(
                        'VIEW ALL PORTSMOUTH COLLECTION',
                        style: TextStyle(fontSize: 14, letterSpacing: 1.2, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Merchandise Section
                  const Text(
                    'Merchandise & Accessories',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 24),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: MediaQuery.of(context).size.width > 900
                        ? 3
                        : MediaQuery.of(context).size.width > 600
                            ? 2
                            : 1,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 0.8,
                    children: [
                      _ProductCard(
                        title: 'Union Mug',
                        price: '£5.99',
                        imageUrl: 'assets/images/zip_up_hoodie.png',
                        onTap: () => Navigator.pushNamed(context, '/product-detail'),
                      ),
                      _ProductCard(
                        title: 'Union Notebook',
                        price: '£3.99',
                        imageUrl: 'assets/images/zip_up_hoodie.png',
                        onTap: () => Navigator.pushNamed(context, '/product-detail'),
                      ),
                      _ProductCard(
                        title: 'Union Pen Set',
                        price: '£4.99',
                        imageUrl: 'assets/images/zip_up_hoodie.png',
                        onTap: () => Navigator.pushNamed(context, '/product-detail'),
                      ),
                      _ProductCard(
                        title: 'Union Water Bottle',
                        price: '£8.99',
                        imageUrl: 'assets/images/zip_up_hoodie.png',
                        onTap: () => Navigator.pushNamed(context, '/product-detail'),
                      ),
                      _ProductCard(
                        title: 'Union Lanyard',
                        price: '£2.99',
                        imageUrl: 'assets/images/zip_up_hoodie.png',
                        onTap: () => Navigator.pushNamed(context, '/product-detail'),
                      ),
                      _ProductCard(
                        title: 'Union Pin Badge Set',
                        price: '£6.99',
                        imageUrl: 'assets/images/zip_up_hoodie.png',
                        onTap: () => Navigator.pushNamed(context, '/product-detail'),
                      ),
                    ],
                  ),
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

// Product Tile Widget (for featured items with pricing)
class _ProductTile extends StatefulWidget {
  final String label;
  final String imageUrl;
  final VoidCallback onTap;
  final String? oldPrice;
  final String? newPrice;

  const _ProductTile({
    required this.label,
    required this.imageUrl,
    required this.onTap,
    this.oldPrice,
    this.newPrice,
  });

  @override
  State<_ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<_ProductTile> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final underlineColor = _hovering ? const Color(0xFF4d2963) : Colors.transparent;

    final ImageProvider<Object> imageProvider = widget.imageUrl.startsWith('assets/')
        ? AssetImage(widget.imageUrl) as ImageProvider<Object>
        : NetworkImage(widget.imageUrl) as ImageProvider<Object>;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
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
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 150),
                    opacity: _hovering ? 0.18 : 0.0,
                    child: Container(color: Colors.white),
                  ),
                ],
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
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.8,
                  color: Colors.black,
                ),
              ),
            ),
            if (widget.newPrice != null && widget.oldPrice != null) ...[
              const SizedBox(height: 6),
              Row(
                children: [
                  Text(
                    widget.oldPrice!,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.newPrice!,
                    style: const TextStyle(
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
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4d2963),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// Product Card Widget (for grid items)
class _ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final VoidCallback onTap;

  const _ProductCard({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF4d2963)),
          ),
        ],
      ),
    );
  }
}
