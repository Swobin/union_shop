import 'package:flutter/material.dart';
import 'package:union_shop/views/collection_page.dart';
import 'package:union_shop/views/essential_range_page.dart';
import 'package:union_shop/views/sale_page.dart';
import 'package:union_shop/views/personalisation_page.dart';
import 'package:union_shop/views/print_shack_about.dart';
import 'package:union_shop/views/product_detail.dart';
import 'package:union_shop/views/cart.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/footer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/collections': (context) => const CollectionPage(),
        '/essential-range': (context) => const EssentialRangePage(),
        '/sale': (context) => const SalePage(),
        '/personalisation': (context) => const PersonalisationPage(),
        '/print-shack-about': (context) => const PrintShackAboutPage(),
        '/product-detail': (context) => const ProductDetailPage(),
        '/cart': (context) => const CartPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(activePage: ''),
            _buildHeroSection(context),
            const SizedBox(height: 60),
            _buildEssentialRange(context),
            const SizedBox(height: 60),
            _buildSignatureRange(context),
            const SizedBox(height: 60),
            _buildPortsmouthCityCollection(context),
            const SizedBox(height: 60),
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/tshirt.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Essential Range - Over 20% OFF!',
              style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Over 20% off our Essential Range. Come and grab yours while stock lasts!',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/essential-range'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4d2963),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              child: const Text('BROWSE COLLECTION'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEssentialRange(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        children: [
          const Text(
            'ESSENTIAL RANGE - OVER 20% OFF!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: _buildProductCard(
                  context,
                  'Limited Edition Essential Zip Hoodies',
                  '£20.00',
                  '£14.99',
                  'assets/images/hoodie.jpg',
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: _buildProductCard(
                  context,
                  'Essential T-Shirt',
                  '£10.00',
                  '£6.99',
                  'assets/images/tshirt.jpg',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSignatureRange(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        children: [
          const Text(
            'SIGNATURE RANGE',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: _buildProductCard(
                  context,
                  'Signature Hoodie',
                  '£25.00',
                  '£25.00',
                  'assets/images/hoodie.jpg',
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: _buildProductCard(
                  context,
                  'Signature T-Shirt',
                  '£12.00',
                  '£12.00',
                  'assets/images/tshirt.jpg',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPortsmouthCityCollection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        children: [
          const Text(
            'PORTSMOUTH CITY COLLECTION',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: _buildProductCard(
                  context,
                  'Portsmouth Hoodie',
                  '£22.00',
                  '£22.00',
                  'assets/images/hoodie.jpg',
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _buildProductCard(
                  context,
                  'Portsmouth T-Shirt',
                  '£11.00',
                  '£11.00',
                  'assets/images/tshirt.jpg',
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _buildProductCard(
                  context,
                  'Portsmouth Sweatshirt',
                  '£20.00',
                  '£20.00',
                  'assets/images/hoodie.jpg',
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _buildProductCard(
                  context,
                  'Portsmouth Cap',
                  '£8.00',
                  '£8.00',
                  'assets/images/tshirt.jpg',
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/collections'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4d2963),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            child: const Text('VIEW ALL'),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(
    BuildContext context,
    String title,
    String originalPrice,
    String salePrice,
    String imagePath,
  ) {
    final bool isOnSale = originalPrice != salePrice;

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/product-detail'),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.asset(
                  imagePath,
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      if (isOnSale)
                        Text(
                          originalPrice,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      if (isOnSale) const SizedBox(width: 8),
                      Text(
                        salePrice,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isOnSale ? const Color(0xFF4d2963) : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
