import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/header.dart';

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

            // Page title
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              color: Colors.grey[100],
              child: const Text(
                'Shop All Products',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),

            // Essential Range Collection
            _buildCollection(
              context,
              title: 'ESSENTIAL RANGE - OVER 20% OFF!',
              isEssentialRange: true,
              products: [
                _ProductData(
                  name: 'Limited Edition Essential Zip Hoodie',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Zip+Hoodie',
                  oldPrice: '£20.00',
                  newPrice: '£14.99',
                ),
                _ProductData(
                  name: 'Essential T-Shirt',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=T-Shirt',
                  oldPrice: '£10.00',
                  newPrice: '£6.99',
                ),
                _ProductData(
                  name: 'Essential Sweatshirt',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Sweatshirt',
                  oldPrice: '£18.00',
                  newPrice: '£12.99',
                ),
                _ProductData(
                  name: 'Essential Joggers',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Joggers',
                  oldPrice: '£16.00',
                  newPrice: '£11.99',
                ),
              ],
            ),

            // Signature Range Collection
            _buildCollection(
              context,
              title: 'Signature Range',
              isEssentialRange: false,
              products: [
                _ProductData(
                  name: 'Signature Hoodie',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Hoodie',
                  newPrice: '£32.99',
                ),
                _ProductData(
                  name: 'Signature T-Shirt',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Signature+Tee',
                  newPrice: '£14.99',
                ),
                _ProductData(
                  name: 'Signature Polo Shirt',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Polo',
                  newPrice: '£19.99',
                ),
                _ProductData(
                  name: 'Signature Jacket',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Jacket',
                  newPrice: '£45.99',
                ),
              ],
            ),

            // Portsmouth City Collection
            _buildCollection(
              context,
              title: 'Portsmouth City Collection',
              isEssentialRange: false,
              products: [
                _ProductData(
                  name: 'Portsmouth City Hoodie',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=City+Hoodie',
                  newPrice: '£29.99',
                ),
                _ProductData(
                  name: 'Portsmouth City T-Shirt',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=City+Tee',
                  newPrice: '£12.99',
                ),
                _ProductData(
                  name: 'Portsmouth City Cap',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Cap',
                  newPrice: '£9.99',
                ),
                _ProductData(
                  name: 'Portsmouth City Tote Bag',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Tote+Bag',
                  newPrice: '£7.99',
                ),
              ],
            ),

            // Merchandise Collection
            _buildCollection(
              context,
              title: 'Merchandise',
              isEssentialRange: false,
              products: [
                _ProductData(
                  name: 'Union Mug',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Mug',
                  newPrice: '£5.99',
                ),
                _ProductData(
                  name: 'Union Water Bottle',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Water+Bottle',
                  newPrice: '£8.99',
                ),
                _ProductData(
                  name: 'Union Notebook',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Notebook',
                  newPrice: '£3.99',
                ),
                _ProductData(
                  name: 'Union Keychain',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Keychain',
                  newPrice: '£2.99',
                ),
                _ProductData(
                  name: 'Union Pen Set',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Pens',
                  newPrice: '£4.99',
                ),
                _ProductData(
                  name: 'Union Stickers Pack',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Stickers',
                  newPrice: '£1.99',
                ),
              ],
            ),

            // Pride Collection
            _buildCollection(
              context,
              title: 'Pride Collection',
              isEssentialRange: false,
              products: [
                _ProductData(
                  name: 'Pride Rainbow Hoodie',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Pride+Hoodie',
                  newPrice: '£27.99',
                ),
                _ProductData(
                  name: 'Pride T-Shirt',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Pride+Tee',
                  newPrice: '£13.99',
                ),
                _ProductData(
                  name: 'Pride Pin Badge',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Pin',
                  newPrice: '£2.50',
                ),
                _ProductData(
                  name: 'Pride Tote Bag',
                  image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Pride+Bag',
                  newPrice: '£6.99',
                ),
              ],
            ),

            const SizedBox(height: 40),

            const AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildCollection(
    BuildContext context, {
    required String title,
    required bool isEssentialRange,
    required List<_ProductData> products,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MouseRegion(
            cursor: isEssentialRange ? SystemMouseCursors.click : SystemMouseCursors.basic,
            child: GestureDetector(
              onTap: isEssentialRange ? () => Navigator.pushNamed(context, '/essential-range') : null,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  decoration: isEssentialRange ? TextDecoration.underline : null,
                  decorationColor: isEssentialRange ? const Color(0xFF4d2963) : null,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 1;
              if (constraints.maxWidth > 1200) {
                crossAxisCount = 4;
              } else if (constraints.maxWidth > 900) {
                crossAxisCount = 3;
              } else if (constraints.maxWidth > 600) {
                crossAxisCount = 2;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.75,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return _ProductCard(
                    name: product.name,
                    image: product.image,
                    oldPrice: product.oldPrice,
                    newPrice: product.newPrice,
                    isEssentialRange: isEssentialRange,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProductData {
  final String name;
  final String image;
  final String? oldPrice;
  final String newPrice;

  _ProductData({
    required this.name,
    required this.image,
    this.oldPrice,
    required this.newPrice,
  });
}

class _ProductCard extends StatefulWidget {
  final String name;
  final String image;
  final String? oldPrice;
  final String newPrice;
  final bool isEssentialRange;

  const _ProductCard({
    required this.name,
    required this.image,
    this.oldPrice,
    required this.newPrice,
    this.isEssentialRange = false,
  });

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: widget.isEssentialRange ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.isEssentialRange ? () => Navigator.pushNamed(context, '/essential-range') : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.image,
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
                    opacity: _hovering ? 0.15 : 0.0,
                    child: Container(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            if (widget.oldPrice != null) ...[
              Row(
                children: [
                  Text(
                    widget.oldPrice!,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.newPrice,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963),
                    ),
                  ),
                ],
              ),
            ] else ...[
              Text(
                widget.newPrice,
                style: const TextStyle(
                  fontSize: 14,
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
