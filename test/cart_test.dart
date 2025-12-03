import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/services/cart_service.dart';

void main() {
  group('CartService Tests', () {
    late CartService cartService;

    setUp(() {
      // Create a fresh cart service instance before each test
      cartService = CartService();
      cartService.clearCart(); // Ensure cart is empty
    });

    test('Cart should be empty initially', () {
      expect(cartService.itemCount, 0);
      expect(cartService.cartItems, isEmpty);
      expect(cartService.subtotal, 0.0);
    });

    test('Adding item to cart should increase item count', () {
      cartService.addToCart(
        name: 'Essential Zip Hoodie',
        image: 'assets/images/zip_up_hoodie.png',
        price: 14.99,
        originalPrice: 20.00,
        size: 'M',
        color: 'Black',
        quantity: 1,
      );

      expect(cartService.itemCount, 1);
      expect(cartService.cartItems.length, 1);
    });

    test('Adding same item should increase quantity, not item count', () {
      cartService.addToCart(
        name: 'Essential Zip Hoodie',
        image: 'assets/images/zip_up_hoodie.png',
        price: 14.99,
        size: 'M',
        color: 'Black',
        quantity: 1,
      );

      cartService.addToCart(
        name: 'Essential Zip Hoodie',
        image: 'assets/images/zip_up_hoodie.png',
        price: 14.99,
        size: 'M',
        color: 'Black',
        quantity: 2,
      );

      expect(cartService.itemCount, 1);
      expect(cartService.cartItems[0]['quantity'], 3);
    });

    test('Adding different sizes should create separate items', () {
      cartService.addToCart(
        name: 'Essential Zip Hoodie',
        image: 'assets/images/zip_up_hoodie.png',
        price: 14.99,
        size: 'M',
        color: 'Black',
        quantity: 1,
      );

      cartService.addToCart(
        name: 'Essential Zip Hoodie',
        image: 'assets/images/zip_up_hoodie.png',
        price: 14.99,
        size: 'L',
        color: 'Black',
        quantity: 1,
      );

      expect(cartService.itemCount, 2);
    });

    test('Adding different colors should create separate items', () {
      cartService.addToCart(
        name: 'Essential Zip Hoodie',
        image: 'assets/images/zip_up_hoodie.png',
        price: 14.99,
        size: 'M',
        color: 'Black',
        quantity: 1,
      );

      cartService.addToCart(
        name: 'Essential Zip Hoodie',
        image: 'assets/images/zip_up_hoodie.png',
        price: 14.99,
        size: 'M',
        color: 'Purple',
        quantity: 1,
      );

      expect(cartService.itemCount, 2);
    });

    test('Subtotal should calculate correctly', () {
      cartService.addToCart(
        name: 'Essential Zip Hoodie',
        image: 'assets/images/zip_up_hoodie.png',
        price: 14.99,
        size: 'M',
        color: 'Black',
        quantity: 2,
      );

      expect(cartService.subtotal, 29.98);
    });

    test('Subtotal with multiple items should calculate correctly', () {
      cartService.addToCart(
        name: 'Essential Zip Hoodie',
        image: 'assets/images/zip_up_hoodie.png',
        price: 14.99,
        size: 'M',
        color: 'Black',
        quantity: 1,
      );

      cartService.addToCart(
        name: 'Essential T-Shirt',
        image: 'assets/images/limited_t_shirt.png',
        price: 6.99,
        size: 'L',
        color: 'Blue',
        quantity: 2,
      );

      expect(cartService.subtotal, 28.97); // 14.99 + (6.99 * 2)
    });

    test('Shipping should be £4.99 for orders under £50', () {
      cartService.addToCart(
        name: 'Essential T-Shirt',
        image: 'assets/images/limited_t_shirt.png',
        price: 10.00,
        size: 'M',
        color: 'Black',
        quantity: 1,
      );

      expect(cartService.shipping, 4.99);
    });

    test('Shipping should be free for orders £50 or more', () {
      cartService.addToCart(
        name: 'Essential Zip Hoodie',
        image: 'assets/images/zip_up_hoodie.png',
        price: 25.00,
        size: 'M',
        color: 'Black',
        quantity: 2,
      );

      expect(cartService.subtotal, 50.00);
      expect(cartService.shipping, 0.0);
    });

    test('Total should include shipping', () {
      cartService.addToCart(
        name: 'Essential T-Shirt',
        image: 'assets/images/limited_t_shirt.png',
        price: 10.00,
        size: 'M',
        color: 'Black',
        quantity: 1,
      );

      expect(cartService.total, 14.99); // 10.00 + 4.99
    });

    test('Total should not include shipping for orders over £50', () {
      cartService.addToCart(
        name: 'Essential Zip Hoodie',
        image: 'assets/images/zip_up_hoodie.png',
        price: 25.00,
        size: 'M',
        color: 'Black',
        quantity: 3,
      );

      expect(cartService.total, 75.00); // 75.00 + 0.00 (free shipping)
    });

    test('Updating quantity should work correctly', () {
      cartService.addToCart(
        name: 'Essential Zip Hoodie',
        image: 'assets/images/zip_up_hoodie.png',
        price: 14.99,
        size: 'M',
        color: 'Black',
        quantity: 1,
      );

      cartService.updateQuantity(0, 5);

      expect(cartService.cartItems[0]['quantity'], 5);
      expect(cartService.subtotal, 74.95); // 14.99 * 5
    });

    test('Updating quantity to 0 should not remove item', () {
      cartService.addToCart(
        name: 'Essential Zip Hoodie',
        image: 'assets/images/zip_up_hoodie.png',
        price: 14.99,
        size: 'M',
        color: 'Black',
        quantity: 1,
      );

      cartService.updateQuantity(0, 0);

      // Quantity 0 or less should be ignored by updateQuantity
      expect(cartService.itemCount, 1);
    });

    test('Removing item should decrease item count', () {
      cartService.addToCart(
        name: 'Essential Zip Hoodie',
        image: 'assets/images/zip_up_hoodie.png',
        price: 14.99,
        size: 'M',
        color: 'Black',
        quantity: 1,
      );

      cartService.addToCart(
        name: 'Essential T-Shirt',
        image: 'assets/images/limited_t_shirt.png',
        price: 6.99,
        size: 'L',
        color: 'Blue',
        quantity: 1,
      );

      expect(cartService.itemCount, 2);

      cartService.removeItem(0);

      expect(cartService.itemCount, 1);
      expect(cartService.cartItems[0]['name'], 'Essential T-Shirt');
    });

    test('Removing invalid index should not crash', () {
      cartService.addToCart(
        name: 'Essential Zip Hoodie',
        image: 'assets/images/zip_up_hoodie.png',
        price: 14.99,
        size: 'M',
        color: 'Black',
        quantity: 1,
      );

      // Should not throw error
      cartService.removeItem(10);

      expect(cartService.itemCount, 1);
    });

    test('Clear cart should remove all items', () {
      cartService.addToCart(
        name: 'Essential Zip Hoodie',
        image: 'assets/images/zip_up_hoodie.png',
        price: 14.99,
        size: 'M',
        color: 'Black',
        quantity: 1,
      );

      cartService.addToCart(
        name: 'Essential T-Shirt',
        image: 'assets/images/limited_t_shirt.png',
        price: 6.99,
        size: 'L',
        color: 'Blue',
        quantity: 1,
      );

      cartService.clearCart();

      expect(cartService.itemCount, 0);
      expect(cartService.subtotal, 0.0);
      expect(cartService.total, 4.99); // Only shipping when cart is empty
    });

    test('Cart should handle items with originalPrice', () {
      cartService.addToCart(
        name: 'Essential Zip Hoodie',
        image: 'assets/images/zip_up_hoodie.png',
        price: 14.99,
        originalPrice: 20.00,
        size: 'M',
        color: 'Black',
        quantity: 1,
      );

      expect(cartService.cartItems[0]['originalPrice'], 20.00);
      expect(cartService.cartItems[0]['price'], 14.99);
      // Subtotal should use sale price, not original price
      expect(cartService.subtotal, 14.99);
    });

    test('Cart should handle items without originalPrice', () {
      cartService.addToCart(
        name: 'Regular Hoodie',
        image: 'assets/images/zip_up_hoodie.png',
        price: 25.00,
        size: 'M',
        color: 'Black',
        quantity: 1,
      );

      expect(cartService.cartItems[0]['originalPrice'], isNull);
      expect(cartService.subtotal, 25.00);
    });

    test('Adding multiple different products should work', () {
      cartService.addToCart(
        name: 'Essential Zip Hoodie',
        image: 'assets/images/zip_up_hoodie.png',
        price: 14.99,
        size: 'M',
        color: 'Black',
        quantity: 1,
      );

      cartService.addToCart(
        name: 'Essential T-Shirt',
        image: 'assets/images/limited_t_shirt.png',
        price: 6.99,
        size: 'L',
        color: 'Blue',
        quantity: 2,
      );

      cartService.addToCart(
        name: 'Signature T-Shirt',
        image: 'assets/images/signature_t_shirt.png',
        price: 12.00,
        size: 'M',
        color: 'Purple',
        quantity: 1,
      );

      expect(cartService.itemCount, 3);
      expect(cartService.subtotal, 40.97); // 14.99 + (6.99*2) + 12.00
    });

    test('Cart items should be unmodifiable', () {
      cartService.addToCart(
        name: 'Essential Zip Hoodie',
        image: 'assets/images/zip_up_hoodie.png',
        price: 14.99,
        size: 'M',
        color: 'Black',
        quantity: 1,
      );

      final items = cartService.cartItems;
      
      // This should throw because the list is unmodifiable
      expect(() => items.add({}), throwsUnsupportedError);
    });

    test('Free shipping threshold should be exactly £50', () {
      cartService.addToCart(
        name: 'Test Product',
        image: 'assets/images/zip_up_hoodie.png',
        price: 49.99,
        size: 'M',
        color: 'Black',
        quantity: 1,
      );

      expect(cartService.shipping, 4.99);

      cartService.clearCart();

      cartService.addToCart(
        name: 'Test Product',
        image: 'assets/images/zip_up_hoodie.png',
        price: 50.00,
        size: 'M',
        color: 'Black',
        quantity: 1,
      );

      expect(cartService.shipping, 0.0);
    });
  });
}