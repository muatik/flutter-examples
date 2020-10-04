import 'package:flutter/material.dart';
import 'package:shopApp/providers/product.dart';
import 'package:uuid/uuid.dart';

class Cart with ChangeNotifier {
  final List<CartItem> items = [];

  void add(CartItem item) {
    items.add(item);
    notifyListeners();
  }

  int count() {
    return items.fold(
        0, (previousValue, element) => element.quantity + previousValue);
  }

  double getTotalAmount() {
    return items.fold(
        0,
        (previousValue, element) =>
            (element.price * element.quantity) + previousValue);
  }

  CartItem findById(String id) {
    return items.firstWhere((element) => element.productId == id);
  }

  bool contains(String id) {
    return items.any((element) => element.productId == id);
  }
}

class CartItem {
  final String id;
  final String productId;
  final String title;
  final String image;
  final double price;
  int quantity;

  CartItem({
    @required this.id,
    @required this.productId,
    @required this.title,
    @required this.image,
    @required this.price,
    @required this.quantity,
  });

  static CartItem from(Product product, int quantity) {
    return CartItem(
        id: Uuid().v4(),
        productId: product.id,
        title: product.title,
        image: product.imageUrl,
        price: product.price,
        quantity: quantity);
  }
}
