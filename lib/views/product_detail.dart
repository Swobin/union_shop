import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/header.dart';

/// Product Detail Page - Shows individual product information
/// Includes: image gallery, size/color selectors, quantity controls, add to basket
/// This satisfies the "Dummy Product Page" requirement (4%)
class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  // State variables for product customization
  int _selectedImageIndex = 0; // Track which product image is displayed
  String _selectedSize = 'M'; // Default selected size
  String _selectedColor = 'Black'; // Default selected color
  int _quantity = 1; // Product quantity (starts at 1)

  // Available product options (hardcoded data)
  final List<String> _sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
  final List<String> _colors = ['Black', 'Navy', 'Purple', 'White', 'Grey'];
  
  // Product images for gallery (using placeholders)
  final List<String> _productImages = [
    'https://via.placeholder.com/600x700/4d2963/FFFFFF?text=Front+View',
    'https://via.placeholder.com/600x700/4d2963/FFFFFF?text=Back+View',
    'https://via.placeholder.com/600x700/4d2963/FFFFFF?text=Side+View',
    'https://via.placeholder.com/600x700/4d2963/FFFFFF?text=Detail+View',
  ];

  /// Increment quantity (add one more item)
  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  /// Decrement quantity (remove one item, minimum is 1)
  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  /// Simulate adding to basket (non-functional, just shows a message)
  void _addToBasket() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Added $_quantity x Essential Hoodie ($_selectedSize, $_selectedColor) to basket',
        ),
        backgroundColor: const Color(0xFF4d2963),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header navigation
            const AppHeader(activePage: 'shop'),

            // Breadcrumb navigation (shows user's location in site hierarchy)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              color: Colors.grey[100],
              child: Row(
                children: [
                  // Clickable breadcrumb links
                  GestureDetector(
                    onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false),
                    child: const Text(
                      'Home',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  const Text(' / ', style: TextStyle(color: Colors.grey)),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/essential-range'),
                    child: const Text(
                      'Essential Range',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  const Text(' / ', style: TextStyle(color: Colors.grey)),
                  const Text(
                    'Essential Zip Hoodie',
                    style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),

            // Main product content area
            Padding(
              padding: const EdgeInsets.all(24),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Responsive layout: side-by-side on desktop, stacked on mobile
                  final isDesktop = constraints.maxWidth > 900;

                  if (isDesktop) {
                    // Desktop layout: image gallery on left, details on right
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left: Product images (60% width)
                        Expanded(
                          flex: 6,
                          child: _buildImageGallery(),
                        ),
                        const SizedBox(width: 48),
                        // Right: Product details (40% width)
                        Expanded(
                          flex: 4,
                          child: _buildProductDetails(),
                        ),
                      ],
                    );
                  } else {
                    // Mobile layout: stacked vertically
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildImageGallery(),
                        const SizedBox(height: 24),
                        _buildProductDetails(),
                      ],
                    );
                  }
                },
              ),
            ),

            // Product description tabs section
            _buildProductTabs(),

            const SizedBox(height: 40),

            // Related products section (optional enhancement)
            _buildRelatedProducts(),

            const SizedBox(height: 40),

            // Footer
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  /// Build the image gallery with main image and thumbnails
  Widget _buildImageGallery() {
    return Column(
      children: [
        // Main large product image
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Image.network(
              _productImages[_selectedImageIndex],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[200],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, size: 80, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Thumbnail image selector
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _productImages.length,
            itemBuilder: (context, index) {
              final isSelected = index == _selectedImageIndex;
              return GestureDetector(
                onTap: () {
                  // Change main image when thumbnail is clicked
                  setState(() {
                    _selectedImageIndex = index;
                  });
                },
                child: Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      // Highlight selected thumbnail with purple border
                      color: isSelected ? const Color(0xFF4d2963) : Colors.grey[300]!,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Image.network(
                    _productImages[index],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Icon(Icons.image_not_supported, color: Colors.grey),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  /// Build product details section (title, price, selectors, add to basket)
  Widget _buildProductDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product title
        const Text(
          'Essential Zip Hoodie',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),

        // Product rating (dummy stars)
        Row(
          children: [
            ...List.generate(5, (index) {
              return Icon(
                index < 4 ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 20,
              );
            }),
            const SizedBox(width: 8),
            Text(
              '(24 reviews)',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Price display with sale pricing
        Row(
          children: [
            // Original price (crossed out)
            const Text(
              '£20.00',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(width: 12),
            // Sale price (highlighted)
            const Text(
              '£14.99',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4d2963),
              ),
            ),
            const SizedBox(width: 12),
            // Discount badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'SAVE 25%',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Short product description
        Text(
          'Premium quality essential zip hoodie. Made from 80% cotton, 20% polyester blend. '
          'Features a full-length zipper, adjustable drawstring hood, and front kangaroo pocket. '
          'Perfect for casual wear and everyday comfort.',
          style: TextStyle(
            fontSize: 15,
            height: 1.6,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 24),

        const Divider(),
        const SizedBox(height: 24),

        // Size selector
        const Text(
          'Size',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        // Dropdown for size selection
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(4),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedSize,
              isExpanded: true,
              items: _sizes.map((size) {
                return DropdownMenuItem(
                  value: size,
                  child: Text(size),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedSize = value;
                  });
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Color selector
        const Text(
          'Color',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        // Color chips for visual selection
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _colors.map((color) {
            final isSelected = color == _selectedColor;
            // Map color names to actual colors
            Color chipColor;
            switch (color) {
              case 'Black':
                chipColor = Colors.black;
                break;
              case 'Navy':
                chipColor = Colors.blue[900]!;
                break;
              case 'Purple':
                chipColor = const Color(0xFF4d2963);
                break;
              case 'White':
                chipColor = Colors.white;
                break;
              case 'Grey':
                chipColor = Colors.grey;
                break;
              default:
                chipColor = Colors.grey;
            }

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = color;
                });
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: chipColor,
                  border: Border.all(
                    // Selected color gets purple border, others grey
                    color: isSelected ? const Color(0xFF4d2963) : Colors.grey[300]!,
                    width: isSelected ? 3 : 1,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                // Show checkmark on selected color
                child: isSelected
                    ? Icon(
                        Icons.check,
                        color: color == 'White' ? Colors.black : Colors.white,
                      )
                    : null,
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 24),

        // Quantity selector
        const Text(
          'Quantity',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            // Decrease quantity button
            IconButton(
              onPressed: _decrementQuantity,
              icon: const Icon(Icons.remove),
              style: IconButton.styleFrom(
                backgroundColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            // Display current quantity
            Container(
              width: 60,
              alignment: Alignment.center,
              child: Text(
                '$_quantity',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            // Increase quantity button
            IconButton(
              onPressed: _incrementQuantity,
              icon: const Icon(Icons.add),
              style: IconButton.styleFrom(
                backgroundColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),

        // Add to basket button (primary action)
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            onPressed: _addToBasket,
            icon: const Icon(Icons.shopping_bag_outlined),
            label: const Text(
              'ADD TO BASKET',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4d2963),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Secondary actions
        Row(
          children: [
            // Add to wishlist button
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Added to wishlist')),
                  );
                },
                icon: const Icon(Icons.favorite_border),
                label: const Text('WISHLIST'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF4d2963),
                  side: const BorderSide(color: Color(0xFF4d2963)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Share button
            OutlinedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Share functionality coming soon')),
                );
              },
              icon: const Icon(Icons.share),
              label: const Text(''),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF4d2963),
                side: const BorderSide(color: Color(0xFF4d2963)),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Product features/benefits
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFeatureRow(Icons.local_shipping, 'Free delivery on orders over £50'),
              const SizedBox(height: 12),
              _buildFeatureRow(Icons.autorenew, '30-day easy returns'),
              const SizedBox(height: 12),
              _buildFeatureRow(Icons.verified_user, '12-month warranty'),
            ],
          ),
        ),
      ],
    );
  }

  /// Helper widget to build feature rows (icon + text)
  Widget _buildFeatureRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFF4d2963)),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }

  /// Build product information tabs (Description, Details, Reviews)
  Widget _buildProductTabs() {
    return DefaultTabController(
      length: 3,
      child: Container(
        color: Colors.grey[50],
        child: Column(
          children: [
            // Tab headers
            TabBar(
              labelColor: const Color(0xFF4d2963),
              unselectedLabelColor: Colors.grey,
              indicatorColor: const Color(0xFF4d2963),
              tabs: const [
                Tab(text: 'DESCRIPTION'),
                Tab(text: 'DETAILS'),
                Tab(text: 'REVIEWS'),
              ],
            ),
            // Tab content
            SizedBox(
              height: 300,
              child: TabBarView(
                children: [
                  // Description tab
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: SingleChildScrollView(
                      child: Text(
                        'Our Essential Zip Hoodie combines comfort and style in one versatile piece. '
                        'Crafted from a premium cotton-polyester blend, this hoodie offers superior '
                        'softness while maintaining its shape wash after wash.\n\n'
                        'Features:\n'
                        '• Full-length YKK zipper for durability\n'
                        '• Adjustable drawstring hood\n'
                        '• Front kangaroo pocket with hidden phone pocket\n'
                        '• Ribbed cuffs and hem for better fit\n'
                        '• Pre-shrunk fabric\n'
                        '• Unisex sizing\n\n'
                        'Perfect for layering or wearing on its own, this hoodie is a wardrobe essential '
                        'for any season. Available in multiple colors to suit your style.',
                        style: TextStyle(fontSize: 15, height: 1.6, color: Colors.grey[700]),
                      ),
                    ),
                  ),
                  // Details/Specifications tab
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailRow('Material', '80% Cotton, 20% Polyester'),
                          _buildDetailRow('Weight', '320 GSM'),
                          _buildDetailRow('Fit', 'Regular/Relaxed'),
                          _buildDetailRow('Care', 'Machine wash cold, tumble dry low'),
                          _buildDetailRow('Origin', 'Made in UK'),
                          _buildDetailRow('SKU', 'ESS-ZIP-HOO-001'),
                        ],
                      ),
                    ),
                  ),
                  // Reviews tab (dummy reviews)
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Customer Reviews',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          _buildReviewCard(
                            'Sarah M.',
                            4,
                            'Great quality!',
                            'Really comfortable and warm. Perfect for the UK weather.',
                          ),
                          const SizedBox(height: 16),
                          _buildReviewCard(
                            'James T.',
                            5,
                            'Best hoodie ever',
                            'Worth every penny. The quality is outstanding and it fits perfectly.',
                          ),
                          const SizedBox(height: 16),
                          _buildReviewCard(
                            'Emily R.',
                            4,
                            'Love it!',
                            'Soft material and great color. Wish there were more color options.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper widget for product detail rows
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Text(value, style: TextStyle(color: Colors.grey[700])),
          ),
        ],
      ),
    );
  }

  /// Helper widget for review cards
  Widget _buildReviewCard(String name, int rating, String title, String review) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              ...List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 16,
                );
              }),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            review,
            style: TextStyle(color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  /// Build related products section
  Widget _buildRelatedProducts() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'You May Also Like',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 320,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                final products = [
                  {'name': 'Essential T-Shirt', 'price': '£6.99', 'oldPrice': '£10.00'},
                  {'name': 'Essential Sweatshirt', 'price': '£12.99', 'oldPrice': '£18.00'},
                  {'name': 'Essential Joggers', 'price': '£11.99', 'oldPrice': '£16.00'},
                  {'name': 'Essential Cap', 'price': '£7.99', 'oldPrice': '£9.99'},
                ];
                final product = products[index];
                
                return Container(
                  width: 250,
                  margin: const EdgeInsets.only(right: 24),
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to another product detail page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const ProductDetailPage()),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            color: Colors.grey[200],
                            child: Image.network(
                              'https://via.placeholder.com/250x250/4d2963/FFFFFF?text=${product['name']}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          product['name']!,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Text(
                              product['oldPrice']!,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              product['price']!,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4d2963),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}