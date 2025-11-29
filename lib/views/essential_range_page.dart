import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/header.dart';

class EssentialRangePage extends StatefulWidget {
  const EssentialRangePage({super.key});

  @override
  State<EssentialRangePage> createState() => _EssentialRangePageState();
}

class _EssentialRangePageState extends State<EssentialRangePage> {
  // Filter state
  String _selectedSort = 'Featured';
  Set<String> _selectedSizes = {};
  Set<String> _selectedColors = {};
  RangeValues _priceRange = const RangeValues(0, 50);

  // Available filter options
  final List<String> _sortOptions = [
    'Featured',
    'Price: Low to High',
    'Price: High to Low',
    'Name: A-Z',
    'Name: Z-A',
  ];

  final List<String> _sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
  final List<String> _colors = ['Black', 'White', 'Navy', 'Purple', 'Grey', 'Red'];

  // Essential Range products only
  final List<_ProductData> _allProducts = [
    _ProductData(
      name: 'Essential Zip Hoodie',
      image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Zip+Hoodie',
      price: 14.99,
      oldPrice: 20.00,
      size: ['S', 'M', 'L', 'XL'],
      color: ['Black', 'Navy', 'Purple'],
    ),
    _ProductData(
      name: 'Essential T-Shirt',
      image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=T-Shirt',
      price: 6.99,
      oldPrice: 10.00,
      size: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
      color: ['Black', 'White', 'Navy', 'Grey'],
    ),
    _ProductData(
      name: 'Essential Sweatshirt',
      image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Sweatshirt',
      price: 12.99,
      oldPrice: 18.00,
      size: ['S', 'M', 'L', 'XL'],
      color: ['Black', 'Navy', 'Grey'],
    ),
    _ProductData(
      name: 'Essential Joggers',
      image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Joggers',
      price: 11.99,
      oldPrice: 16.00,
      size: ['S', 'M', 'L', 'XL', 'XXL'],
      color: ['Black', 'Navy', 'Grey'],
    ),
    _ProductData(
      name: 'Essential Polo Shirt',
      image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Polo',
      price: 9.99,
      oldPrice: 12.00,
      size: ['S', 'M', 'L', 'XL'],
      color: ['White', 'Navy', 'Purple'],
    ),
    _ProductData(
      name: 'Essential Shorts',
      image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Shorts',
      price: 8.99,
      oldPrice: 11.00,
      size: ['S', 'M', 'L', 'XL'],
      color: ['Black', 'Navy'],
    ),
    _ProductData(
      name: 'Essential Cap',
      image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Cap',
      price: 7.99,
      oldPrice: 9.99,
      size: ['One Size'],
      color: ['Black', 'Navy', 'White', 'Red'],
    ),
    _ProductData(
      name: 'Essential Socks (3-Pack)',
      image: 'https://via.placeholder.com/400x500/4d2963/FFFFFF?text=Socks',
      price: 5.99,
      oldPrice: 7.99,
      size: ['S', 'M', 'L'],
      color: ['Black', 'White', 'Grey'],
    ),
  ];

  List<_ProductData> get _filteredProducts {
    var filtered = _allProducts.where((product) {
      // Price filter
      if (product.price < _priceRange.start || product.price > _priceRange.end) {
        return false;
      }

      // Size filter
      if (_selectedSizes.isNotEmpty) {
        if (!product.size.any((size) => _selectedSizes.contains(size))) {
          return false;
        }
      }

      // Color filter
      if (_selectedColors.isNotEmpty) {
        if (!product.color.any((color) => _selectedColors.contains(color))) {
          return false;
        }
      }

      return true;
    }).toList();

    // Sort
    switch (_selectedSort) {
      case 'Price: Low to High':
        filtered.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Price: High to Low':
        filtered.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Name: A-Z':
        filtered.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'Name: Z-A':
        filtered.sort((a, b) => b.name.compareTo(a.name));
        break;
      default: // Featured
        break;
    }

    return filtered;
  }

  void _clearFilters() {
    setState(() {
      _selectedSizes.clear();
      _selectedColors.clear();
      _priceRange = const RangeValues(0, 50);
      _selectedSort = 'Featured';
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = _filteredProducts;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(activePage: 'shop'),

            // Collection header with sale banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF4d2963),
                    const Color(0xFF4d2963).withOpacity(0.8),
                  ],
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'ESSENTIAL RANGE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'OVER 20% OFF!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '${filteredProducts.length} Products',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            // Main content area
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Filters sidebar (desktop only)
                  if (MediaQuery.of(context).size.width > 900)
                    SizedBox(
                      width: 250,
                      child: _buildFilterSidebar(),
                    ),

                  if (MediaQuery.of(context).size.width > 900)
                    const SizedBox(width: 24),

                  // Products grid
                  Expanded(
                    child: Column(
                      children: [
                        // Mobile filter button & sort dropdown
                        _buildTopBar(context),

                        const SizedBox(height: 24),

                        // Products grid
                        _buildProductsGrid(filteredProducts),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 900;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Mobile filter button
        if (isMobile)
          ElevatedButton.icon(
            onPressed: () => _showMobileFilters(context),
            icon: const Icon(Icons.filter_list),
            label: const Text('Filters'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              side: BorderSide(color: Colors.grey[300]!),
            ),
          )
        else
          TextButton.icon(
            onPressed: _clearFilters,
            icon: const Icon(Icons.clear),
            label: const Text('Clear Filters'),
          ),

        // Sort dropdown
        Row(
          children: [
            const Text('Sort by: '),
            const SizedBox(width: 8),
            DropdownButton<String>(
              value: _selectedSort,
              underline: Container(),
              items: _sortOptions.map((sort) {
                return DropdownMenuItem(value: sort, child: Text(sort));
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedSort = value);
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFilterSidebar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Filters',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: _clearFilters,
              child: const Text('Clear all'),
            ),
          ],
        ),
        const Divider(),

        // Price filter
        const Text('Price Range', style: TextStyle(fontWeight: FontWeight.w600)),
        RangeSlider(
          values: _priceRange,
          min: 0,
          max: 50,
          divisions: 10,
          activeColor: const Color(0xFF4d2963),
          labels: RangeLabels(
            '£${_priceRange.start.round()}',
            '£${_priceRange.end.round()}',
          ),
          onChanged: (values) {
            setState(() => _priceRange = values);
          },
        ),
        Text(
          '£${_priceRange.start.round()} - £${_priceRange.end.round()}',
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),

        const SizedBox(height: 24),
        const Divider(),

        // Size filter
        const Text('Size', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _sizes.map((size) {
            final isSelected = _selectedSizes.contains(size);
            return FilterChip(
              label: Text(size),
              selected: isSelected,
              selectedColor: const Color(0xFF4d2963),
              checkmarkColor: Colors.white,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedSizes.add(size);
                  } else {
                    _selectedSizes.remove(size);
                  }
                });
              },
            );
          }).toList(),
        ),

        const SizedBox(height: 24),
        const Divider(),

        // Color filter
        const Text('Color', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        ..._colors.map((color) {
          final isSelected = _selectedColors.contains(color);
          return CheckboxListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(color),
            value: isSelected,
            activeColor: const Color(0xFF4d2963),
            onChanged: (selected) {
              setState(() {
                if (selected == true) {
                  _selectedColors.add(color);
                } else {
                  _selectedColors.remove(color);
                }
              });
            },
          );
        }),
      ],
    );
  }

  Widget _buildProductsGrid(List<_ProductData> products) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 1;
        if (constraints.maxWidth > 1200) {
          crossAxisCount = 4;
        } else if (constraints.maxWidth > 900) {
          crossAxisCount = 3;
        } else if (constraints.maxWidth > 600) {
          crossAxisCount = 2;
        }

        if (products.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(48.0),
              child: Text(
                'No products found matching your filters.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          );
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
            return _ProductCard(product: product);
          },
        );
      },
    );
  }

  void _showMobileFilters(BuildContext context) {
    // Create temporary filter state for the modal
    Set<String> tempSizes = Set.from(_selectedSizes);
    Set<String> tempColors = Set.from(_selectedColors);
    RangeValues tempPriceRange = _priceRange;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return DraggableScrollableSheet(
              initialChildSize: 0.9,
              minChildSize: 0.5,
              maxChildSize: 0.95,
              expand: false,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Filters',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => Navigator.pop(ctx),
                            ),
                          ],
                        ),
                        const Divider(),
                        
                        // Inline filter UI (instead of calling _buildFilterSidebar which uses main state)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Price Range', style: TextStyle(fontWeight: FontWeight.w600)),
                            RangeSlider(
                              values: tempPriceRange,
                              min: 0,
                              max: 50,
                              divisions: 10,
                              activeColor: const Color(0xFF4d2963),
                              labels: RangeLabels(
                                '£${tempPriceRange.start.round()}',
                                '£${tempPriceRange.end.round()}',
                              ),
                              onChanged: (values) {
                                setModalState(() => tempPriceRange = values);
                              },
                            ),
                            Text(
                              '£${tempPriceRange.start.round()} - £${tempPriceRange.end.round()}',
                              style: TextStyle(color: Colors.grey[600], fontSize: 12),
                            ),
                            const SizedBox(height: 24),
                            const Divider(),
                            
                            const Text('Size', style: TextStyle(fontWeight: FontWeight.w600)),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: _sizes.map((size) {
                                final isSelected = tempSizes.contains(size);
                                return FilterChip(
                                  label: Text(size),
                                  selected: isSelected,
                                  selectedColor: const Color(0xFF4d2963),
                                  checkmarkColor: Colors.white,
                                  labelStyle: TextStyle(
                                    color: isSelected ? Colors.white : Colors.black,
                                  ),
                                  onSelected: (selected) {
                                    setModalState(() {
                                      if (selected) {
                                        tempSizes.add(size);
                                      } else {
                                        tempSizes.remove(size);
                                      }
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 24),
                            const Divider(),
                            
                            const Text('Color', style: TextStyle(fontWeight: FontWeight.w600)),
                            const SizedBox(height: 8),
                            ..._colors.map((color) {
                              final isSelected = tempColors.contains(color);
                              return CheckboxListTile(
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                title: Text(color),
                                value: isSelected,
                                activeColor: const Color(0xFF4d2963),
                                onChanged: (selected) {
                                  setModalState(() {
                                    if (selected == true) {
                                      tempColors.add(color);
                                    } else {
                                      tempColors.remove(color);
                                    }
                                  });
                                },
                              );
                            }),
                          ],
                        ),
                        
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedSizes = tempSizes;
                                _selectedColors = tempColors;
                                _priceRange = tempPriceRange;
                              });
                              Navigator.pop(ctx);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4d2963),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text('Apply Filters'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

class _ProductData {
  final String name;
  final String image;
  final double price;
  final double? oldPrice;
  final List<String> size;
  final List<String> color;

  _ProductData({
    required this.name,
    required this.image,
    required this.price,
    this.oldPrice,
    required this.size,
    required this.color,
  });
}

class _ProductCard extends StatefulWidget {
  final _ProductData product;

  const _ProductCard({required this.product});

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
      child: GestureDetector(
        onTap: () {
          print('Clicked on ${widget.product.name}');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.product.image,
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
                  if (widget.product.oldPrice != null)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        color: Colors.red,
                        child: const Text(
                          'SALE',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.product.name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            if (widget.product.oldPrice != null) ...[
              Row(
                children: [
                  Text(
                    '£${widget.product.oldPrice!.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '£${widget.product.price.toStringAsFixed(2)}',
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
                '£${widget.product.price.toStringAsFixed(2)}',
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