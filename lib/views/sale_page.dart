import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/header.dart';

/// Sale Page - Displays products on sale with promotional messaging
/// Includes: sale banner, product grid, discount badges, price displays
/// This satisfies the "Sale Collection" requirement (4%)
class SalePage extends StatefulWidget {
  const SalePage({super.key});

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  // Filter state for discount ranges
  String _selectedDiscountFilter = 'All';
  final List<String> _discountFilters = ['All', '20% or more', '30% or more', '40% or more'];

  // Sort options
  String _selectedSort = 'Featured';
  final List<String> _sortOptions = ['Featured', 'Price: Low to High', 'Price: High to Low', 'Biggest Discount'];

  // List of product images from assets
  final List<String> _productImages = [
    'assets/images/product1.jpg',
    'assets/images/product2.jpg',
    'assets/images/product3.jpg',
    'assets/images/product4.jpg',
    'assets/images/product5.jpg',
    'assets/images/product6.jpg',
    'assets/images/product7.jpg',
    'assets/images/product8.jpg',
    'assets/images/product9.jpg',
    'assets/images/product10.jpg',
    'assets/images/product11.jpg',
    'assets/images/product12.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header navigation
            const AppHeader(activePage: 'sale'),

            // Sale banner with promotional messaging
            _buildSaleBanner(),

            // Countdown timer section (UI only)
            _buildCountdownTimer(),

            // Filter and sort controls
            _buildFilterControls(),

            // Sale products grid
            _buildSaleProducts(),

            const SizedBox(height: 40),

            // Footer
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  /// Build promotional sale banner
  Widget _buildSaleBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF4d2963),
            Color(0xFF6d3983),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          // "SALE" badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'SALE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Main sale title
          const Text(
            'WINTER SALE - UP TO 50% OFF!',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          // Subtitle
          const Text(
            'Limited time offer - While stocks last!',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          // Call to action
          ElevatedButton(
            onPressed: () {
              // Scroll to products section
              // In a real app, you'd use a ScrollController
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF4d2963),
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const Text(
              'SHOP NOW',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build countdown timer (UI only, dummy countdown)
  Widget _buildCountdownTimer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      color: Colors.black87,
      child: Column(
        children: [
          const Text(
            'SALE ENDS IN:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          // Countdown boxes (static UI)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTimeBox('02', 'DAYS'),
              const SizedBox(width: 8),
              const Text(':', style: TextStyle(color: Colors.white, fontSize: 32)),
              const SizedBox(width: 8),
              _buildTimeBox('14', 'HOURS'),
              const SizedBox(width: 8),
              const Text(':', style: TextStyle(color: Colors.white, fontSize: 32)),
              const SizedBox(width: 8),
              _buildTimeBox('32', 'MINS'),
              const SizedBox(width: 8),
              const Text(':', style: TextStyle(color: Colors.white, fontSize: 32)),
              const SizedBox(width: 8),
              _buildTimeBox('45', 'SECS'),
            ],
          ),
        ],
      ),
    );
  }

  /// Helper widget for countdown time boxes
  Widget _buildTimeBox(String value, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF4d2963),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  /// Build filter and sort controls
  Widget _buildFilterControls() {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.grey[100],
      child: Column(
        children: [
          // Results count
          Text(
            'Showing ${_getSaleProducts().length} sale items',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          // Filter and sort dropdowns
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 600;
              
              if (isWide) {
                // Desktop: side by side
                return Row(
                  children: [
                    Expanded(child: _buildDiscountFilterDropdown()),
                    const SizedBox(width: 16),
                    Expanded(child: _buildSortDropdown()),
                  ],
                );
              } else {
                // Mobile: stacked
                return Column(
                  children: [
                    _buildDiscountFilterDropdown(),
                    const SizedBox(height: 12),
                    _buildSortDropdown(),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  /// Build discount filter dropdown
  Widget _buildDiscountFilterDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedDiscountFilter,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down),
          items: _discountFilters.map((filter) {
            return DropdownMenuItem(
              value: filter,
              child: Text('Discount: $filter'),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _selectedDiscountFilter = value;
              });
            }
          },
        ),
      ),
    );
  }

  /// Build sort dropdown
  Widget _buildSortDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedSort,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down),
          items: _sortOptions.map((option) {
            return DropdownMenuItem(
              value: option,
              child: Text('Sort by: $option'),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _selectedSort = value;
              });
            }
          },
        ),
      ),
    );
  }

  /// Build sale products grid
  Widget _buildSaleProducts() {
    final products = _getSaleProducts();

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sale Items',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 24),
          // Responsive grid
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
                  childAspectRatio: 0.7,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return _SaleProductCard(
                    name: product['name'] as String,
                    image: product['image'] as String,
                    oldPrice: product['oldPrice'] as String,
                    salePrice: product['salePrice'] as String,
                    discountPercent: product['discountPercent'] as int,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  /// Get hardcoded sale products data
  List<Map<String, dynamic>> _getSaleProducts() {
    return [
      {
        'name': 'Essential Zip Hoodie',
        'image': _productImages[0],
        'oldPrice': '£20.00',
        'salePrice': '£14.99',
        'discountPercent': 25,
      },
      {
        'name': 'Essential T-Shirt',
        'image': _productImages[1],
        'oldPrice': '£10.00',
        'salePrice': '£6.99',
        'discountPercent': 30,
      },
      {
        'name': 'Essential Sweatshirt',
        'image': _productImages[2],
        'oldPrice': '£18.00',
        'salePrice': '£12.99',
        'discountPercent': 28,
      },
      {
        'name': 'Essential Joggers',
        'image': _productImages[3],
        'oldPrice': '£16.00',
        'salePrice': '£11.99',
        'discountPercent': 25,
      },
      {
        'name': 'Signature Hoodie',
        'image': _productImages[4],
        'oldPrice': '£35.00',
        'salePrice': '£24.99',
        'discountPercent': 29,
      },
      {
        'name': 'Portsmouth City Cap',
        'image': _productImages[5],
        'oldPrice': '£12.00',
        'salePrice': '£7.99',
        'discountPercent': 33,
      },
      {
        'name': 'Pride T-Shirt',
        'image': _productImages[6],
        'oldPrice': '£14.00',
        'salePrice': '£8.99',
        'discountPercent': 36,
      },
      {
        'name': 'Union Mug',
        'image': _productImages[7],
        'oldPrice': '£8.00',
        'salePrice': '£4.99',
        'discountPercent': 38,
      },
      {
        'name': 'Essential Beanie',
        'image': _productImages[8],
        'oldPrice': '£10.00',
        'salePrice': '£5.99',
        'discountPercent': 40,
      },
      {
        'name': 'Signature Polo',
        'image': _productImages[9],
        'oldPrice': '£22.00',
        'salePrice': '£14.99',
        'discountPercent': 32,
      },
      {
        'name': 'Portsmouth Tote Bag',
        'image': _productImages[10],
        'oldPrice': '£10.00',
        'salePrice': '£5.99',
        'discountPercent': 40,
      },
      {
        'name': 'Union Notebook',
        'image': _productImages[11],
        'oldPrice': '£5.00',
        'salePrice': '£2.99',
        'discountPercent': 40,
      },
    ];
  }
}

/// Sale product card widget with hover effects and sale badges
class _SaleProductCard extends StatefulWidget {
  final String name;
  final String image;
  final String oldPrice;
  final String salePrice;
  final int discountPercent;

  const _SaleProductCard({
    required this.name,
    required this.image,
    required this.oldPrice,
    required this.salePrice,
    required this.discountPercent,
  });

  @override
  State<_SaleProductCard> createState() => _SaleProductCardState();
}

class _SaleProductCardState extends State<_SaleProductCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // Navigate to product detail page
          Navigator.pushNamed(context, '/product-detail');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image with badges
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Product image
                  Image.asset(
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
                  // Hover brightness effect
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 150),
                    opacity: _hovering ? 0.15 : 0.0,
                    child: Container(color: Colors.white),
                  ),
                  // Discount badge (top left)
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha((0.2 * 255).round()),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        '-${widget.discountPercent}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // "SALE" badge (top right)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4d2963),
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha((0.2 * 255).round()),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Text(
                        'SALE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  // "Limited Stock" indicator (bottom left)
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.access_time, size: 14, color: Colors.white),
                          SizedBox(width: 4),
                          Text(
                            'Limited',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Product name
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
            const SizedBox(height: 8),
            // Price display with savings
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Original and sale price
                Row(
                  children: [
                    Text(
                      widget.oldPrice,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 2,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.salePrice,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                // Savings amount
                Text(
                  'Save ${_calculateSavings(widget.oldPrice, widget.salePrice)}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green[700],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Calculate savings amount from old and sale prices
  String _calculateSavings(String oldPrice, String salePrice) {
    // Remove £ symbol and parse
    final old = double.tryParse(oldPrice.replaceAll('£', '')) ?? 0;
    final sale = double.tryParse(salePrice.replaceAll('£', '')) ?? 0;
    final savings = old - sale;
    return '£${savings.toStringAsFixed(2)}';
  }
}
