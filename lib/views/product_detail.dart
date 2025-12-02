import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/services/cart_service.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String _selectedSize = 'M';
  int _selectedColorIndex = 0;
  int _quantity = 1;
  int _selectedImageIndex = 0;

  final List<String> _sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
  final List<Color> _colors = [
    Colors.black,
    const Color(0xFF4d2963),
    Colors.grey,
    Colors.blue,
    Colors.red,
  ];

  // Product images from assets - using existing images
  final List<String> _productImages = [
    'assets/images/zip_up_hoodie.png',
    'assets/images/zip_up_hoodie.png',
    'assets/images/zip_up_hoodie.png',
    'assets/images/zip_up_hoodie.png',
  ];

  // Related products images - using existing images
  final List<String> _relatedProductImages = [
    'assets/images/limited_t_shirt.png',
    'assets/images/signature_t_shirt.png',
    'assets/images/zip_up_hoodie.png',
    'assets/images/limited_t_shirt.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(activePage: ''),
            _buildBreadcrumb(),
            _buildProductSection(),
            _buildTabs(),
            const SizedBox(height: 40),
            _buildRelatedProducts(),
            const SizedBox(height: 40),
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildBreadcrumb() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: Colors.grey[100],
      child: Row(
        children: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/'),
            child: const Text('Home'),
          ),
          const Text(' > '),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/essential-range'),
            child: const Text('Essential Range'),
          ),
          const Text(' > '),
          const Text('Essential Zip Hoodie'),
        ],
      ),
    );
  }

  Widget _buildProductSection() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildImageGallery()),
          const SizedBox(width: 40),
          Expanded(child: _buildProductInfo()),
        ],
      ),
    );
  }

  Widget _buildImageGallery() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                _productImages[_selectedImageIndex],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: List.generate(
            _productImages.length,
            (index) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: GestureDetector(
                  onTap: () => setState(() => _selectedImageIndex = index),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _selectedImageIndex == index ? const Color(0xFF4d2963) : Colors.grey[300]!,
                        width: _selectedImageIndex == index ? 3 : 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset(
                          _productImages[index],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Icon(Icons.image_not_supported, color: Colors.grey),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Essential Zip Hoodie',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ...List.generate(
              5,
              (index) => const Icon(Icons.star, color: Colors.amber, size: 20),
            ),
            const SizedBox(width: 8),
            const Text('(24 reviews)'),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Text(
              '£20.00',
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              '£14.99',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'SAVE 25%',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Premium quality essential zip hoodie perfect for everyday wear. Made from soft, durable fabric with a comfortable fit.',
          style: TextStyle(fontSize: 16, height: 1.6),
        ),
        const SizedBox(height: 24),
        _buildSizeSelector(),
        const SizedBox(height: 16),
        _buildColorSelector(),
        const SizedBox(height: 16),
        _buildQuantitySelector(),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  final cartService = CartService();
                  cartService.addToCart(
                    name: 'Essential Zip Hoodie',
                    image: _productImages[_selectedImageIndex], // Use the selected image
                    price: 14.99,
                    originalPrice: 20.00,
                    size: _selectedSize,
                    color: _getColorName(_selectedColorIndex),
                    quantity: _quantity,
                  );
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Added $_quantity x Essential Hoodie (${_getColorName(_selectedColorIndex)}, $_selectedSize) to cart'),
                      duration: const Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'VIEW CART',
                        onPressed: () {
                          Navigator.pushNamed(context, '/cart');
                        },
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_bag),
                label: const Text('ADD TO BASKET'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4d2963),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to wishlist'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                icon: const Icon(Icons.favorite_border),
                label: const Text('WISHLIST'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(width: 12),
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Share functionality coming soon'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              icon: const Icon(Icons.share),
              style: IconButton.styleFrom(
                side: BorderSide(color: Colors.grey[300]!),
                padding: const EdgeInsets.all(16),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _buildFeatures(),
      ],
    );
  }

  String _getColorName(int index) {
    const colorNames = ['Black', 'Purple', 'Grey', 'Blue', 'Red'];
    return colorNames[index];
  }

  Widget _buildSizeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Size', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(4),
          ),
          child: DropdownButton<String>(
            value: _selectedSize,
            isExpanded: true,
            underline: const SizedBox(),
            items: _sizes.map((size) {
              return DropdownMenuItem(value: size, child: Text(size));
            }).toList(),
            onChanged: (value) => setState(() => _selectedSize = value!),
          ),
        ),
      ],
    );
  }

  Widget _buildColorSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Row(
          children: List.generate(_colors.length, (index) {
            return GestureDetector(
              onTap: () => setState(() => _selectedColorIndex = index),
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _colors[index],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _selectedColorIndex == index ? const Color(0xFF4d2963) : Colors.grey[300]!,
                    width: _selectedColorIndex == index ? 3 : 1,
                  ),
                ),
                child: _selectedColorIndex == index ? const Icon(Icons.check, color: Colors.white, size: 20)
                    : null,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildQuantitySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Quantity', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Row(
          children: [
            IconButton(
              onPressed: () {
                if (_quantity > 1) setState(() => _quantity--);
              },
              icon: const Icon(Icons.remove),
              style: IconButton.styleFrom(
                side: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('$_quantity', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            IconButton(
              onPressed: () => setState(() => _quantity++),
              icon: const Icon(Icons.add),
              style: IconButton.styleFrom(
                side: BorderSide(color: Colors.grey[300]!),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatures() {
    return Column(
      children: [
        _buildFeatureRow(Icons.local_shipping, 'Free delivery on orders over £50'),
        _buildFeatureRow(Icons.autorenew, '30-day easy returns'),
        _buildFeatureRow(Icons.verified_user, '12-month warranty'),
      ],
    );
  }

  Widget _buildFeatureRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF4d2963)),
          const SizedBox(width: 12),
          Text(text),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            labelColor: Color(0xFF4d2963),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFF4d2963),
            tabs: [
              Tab(text: 'DESCRIPTION'),
              Tab(text: 'DETAILS'),
              Tab(text: 'REVIEWS'),
            ],
          ),
          SizedBox(
            height: 300,
            child: TabBarView(
              children: [
                _buildDescriptionTab(),
                _buildDetailsTab(),
                _buildReviewsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionTab() {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Text(
        'Our Essential Zip Hoodie combines comfort with style. Made from premium cotton blend fabric, this hoodie features a full-length zipper, adjustable drawstring hood, and spacious front pockets. Perfect for layering or wearing on its own.',
        style: TextStyle(fontSize: 16, height: 1.6),
      ),
    );
  }

  Widget _buildDetailsTab() {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Material', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('80% Cotton, 20% Polyester'),
          SizedBox(height: 16),
          Text('Care Instructions', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Machine wash cold, tumble dry low'),
          SizedBox(height: 16),
          Text('Origin', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Made in UK'),
        ],
      ),
    );
  }

  Widget _buildReviewsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Customer Reviews',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildReview('Sarah M.', 5, 'Great quality hoodie! Very comfortable.'),
          _buildReview('James T.', 4, 'Nice fit, good value for money.'),
        ],
      ),
    );
  }

  Widget _buildReview(String name, int rating, String comment) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(width: 8),
              ...List.generate(
                rating,
                (_) => const Icon(Icons.star, color: Colors.amber, size: 16),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(comment),
        ],
      ),
    );
  }

  Widget _buildRelatedProducts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'You May Also Like',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              _buildRelatedProduct('Essential T-Shirt', '£10.00', _relatedProductImages[0]),
              const SizedBox(width: 16),
              _buildRelatedProduct('Signature T-Shirt', '£12.00', _relatedProductImages[1]),
              const SizedBox(width: 16),
              _buildRelatedProduct('Essential Hoodie', '£25.00', _relatedProductImages[2]),
              const SizedBox(width: 16),
              _buildRelatedProduct('Limited T-Shirt', '£9.99', _relatedProductImages[3]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedProduct(String name, String price, String imagePath) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Navigate to product detail (in real app, pass product data)
          Navigator.pushNamed(context, '/product-detail');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    imagePath,
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
              ),
            ),
            const SizedBox(height: 8),
            Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
            Text(price, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4d2963))),
          ],
        ),
      ),
    );
  }
}