import 'package:flutter/foundation.dart';

class CartService extends ChangeNotifier {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => List.unmodifiable(_cartItems);

  int get itemCount => _cartItems.length;

  void addToCart({
    required String name,
    required String image,
    required double price,
    double? originalPrice,
    required String size,
    required String color,
    int quantity = 1,
  }) {
    // Check if item already exists
    final existingIndex = _cartItems.indexWhere(
      (item) => item['name'] == name && item['size'] == size && item['color'] == color,
    );

    if (existingIndex >= 0) {
      // Update quantity if item exists
      _cartItems[existingIndex]['quantity'] += quantity;
    } else {
      // Add new item
      _cartItems.add({
        'name': name,
        'image': image,
        'price': price,
        'originalPrice': originalPrice,
        'size': size,
        'color': color,
        'quantity': quantity,
      });
    }

    notifyListeners();
  }

  void updateQuantity(int index, int newQuantity) {
    if (newQuantity > 0 && index < _cartItems.length) {
      _cartItems[index]['quantity'] = newQuantity;
      notifyListeners();
    }
  }

  void removeItem(int index) {
    if (index < _cartItems.length) {
      _cartItems.removeAt(index);
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  double get subtotal {
    return _cartItems.fold(
      0,
      (sum, item) => sum + (item['price'] * item['quantity']),
    );
  }

  double get shipping {
    return subtotal >= 50 ? 0 : 4.99;
  }

  double get total {
    return subtotal + shipping;
  }
}