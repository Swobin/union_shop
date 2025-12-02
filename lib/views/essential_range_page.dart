import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/footer.dart';

class EssentialRangePage extends StatefulWidget {
  const EssentialRangePage({super.key});

  @override
  State<EssentialRangePage> createState() => _EssentialRangePageState();
}

class _EssentialRangePageState extends State<EssentialRangePage> {
  String _selectedSort = 'Featured';
  final List<String> _sortOptions = [
    'Featured',
    'Price: Low to High',
    'Price: High to Low',
    'Biggest Discount',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(activePage: 'shop'),

            // Sale banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4d2963), Color(0xFF6d3983)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'ESSENTIAL RANGE - OVER 20% OFF!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Limited time offer - While stocks last!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'SAVE UP TO 25%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Filter and sort bar
            Container(
              padding: const EdgeInsets.all(24),
              color: Colors.grey[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Showing 8 sale items',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: DropdownButton<String>(
                      value: _selectedSort,
                      underline: const SizedBox(),
                      items: _sortOptions.map((option) {
                        return DropdownMenuItem(
                          value: option,
                          child: Text('Sort: $option'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedSort = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Products grid
            Padding(
              padding: const EdgeInsets.all(24),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.7,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  final products = [
                    {'name': 'Essential Zip Hoodie', 'oldPrice': '£20.00', 'newPrice': '£14.99', 'discount': 25},
                    {'name': 'Essential T-Shirt', 'oldPrice': '£10.00', 'newPrice': '£6.99', 'discount': 30},
                    {'name': 'Essential Sweatshirt', 'oldPrice': '£18.00', 'newPrice': '£12.99', 'discount': 28},
                    {'name': 'Essential Joggers', 'oldPrice': '£16.00', 'newPrice': '£11.99', 'discount': 25},
                    {'name': 'Essential Cap', 'oldPrice': '£9.99', 'newPrice': '£7.99', 'discount': 20},
                    {'name': 'Essential Beanie', 'oldPrice': '£10.00', 'newPrice': '£5.99', 'discount': 40},
                    {'name': 'Essential Polo', 'oldPrice': '£22.00', 'newPrice': '£16.99', 'discount': 23},
                    {'name': 'Essential Shorts', 'oldPrice': '£14.00', 'newPrice': '£10.99', 'discount': 21},
                  ];

                  final product = products[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/product-detail');
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                'https://via.placeholder.com/300x400/4d2963/FFFFFF?text=${product['name']}',
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 12,
                                left: 12,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    '-${product['discount']}%',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          product['name'] as String,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              product['oldPrice'] as String,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              product['newPrice'] as String,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const AppFooter(),
          ],
        ),
      ),
    );
  }
}