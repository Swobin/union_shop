import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/footer.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  String _selectedSort = 'Featured';
  final List<String> _sortOptions = [
    'Featured',
    'Price: Low to High',
    'Price: High to Low',
    'Newest',
  ];

  // List of product images from assets - cycling through the 3 available images
  final List<String> _productImages = [
    'assets/images/limited_t_shirt.png',
    'assets/images/signature_t_shirt.png',
    'assets/images/zip_up_hoodie.png',
    'assets/images/limited_t_shirt.png',
    'assets/images/signature_t_shirt.png',
    'assets/images/zip_up_hoodie.png',
    'assets/images/limited_t_shirt.png',
    'assets/images/signature_t_shirt.png',
    'assets/images/zip_up_hoodie.png',
    'assets/images/limited_t_shirt.png',
    'assets/images/signature_t_shirt.png',
    'assets/images/zip_up_hoodie.png',
  ];

  // Product names for Portsmouth City Collection
  final List<String> _productNames = [
    'Portsmouth City T-Shirt',
    'Portsmouth Signature Tee',
    'Portsmouth Zip Hoodie',
    'Portsmouth Limited Edition Shirt',
    'Portsmouth Classic T-Shirt',
    'Portsmouth Navy Hoodie',
    'Portsmouth Crew Neck Tee',
    'Portsmouth Graphic Shirt',
    'Portsmouth Premium Hoodie',
    'Portsmouth Vintage T-Shirt',
    'Portsmouth Sports Tee',
    'Portsmouth Essential Hoodie',
  ];

  // Product prices
  final List<String> _productPrices = [
    '£19.99',
    '£16.99',
    '£24.99',
    '£18.99',
    '£15.99',
    '£26.99',
    '£17.99',
    '£19.99',
    '£28.99',
    '£16.99',
    '£18.99',
    '£25.99',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(activePage: 'collections'),

            // Collection banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              color: Colors.grey[100],
              child: const Text(
                'Portsmouth City Collection',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),

            // Filter and sort bar
            Container(
              padding: const EdgeInsets.all(24),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '12 products',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
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
                  crossAxisCount: 3,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.7,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/product-detail');
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                _productImages[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[300],
                                    child: const Icon(
                                      Icons.image_not_supported,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _productNames[index],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _productPrices[index],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4d2963),
                          ),
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