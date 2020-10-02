import 'package:flutter/foundation.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  const Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
  });

  static final List<Product> products = [
    Product(
        id: 'id1',
        title: 'Product 1',
        description: 'product 1 description',
        price: 39,
        imageUrl:
            'https://images.unsplash.com/photo-1545289414-1c3cb1c06238?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80'),
    Product(
        id: 'id2',
        title: 'Nice Mug',
        description: 'product 2 description',
        price: 49,
        imageUrl:
            'https://images.unsplash.com/photo-1514228742587-6b1558fcca3d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80'),
    Product(
        id: 'id3',
        title: 'Elegant Table',
        description: 'product 3 description',
        price: 59,
        imageUrl:
            'https://images.unsplash.com/photo-1533090481720-856c6e3c1fdc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'),
  ];

  static List<Product> findAll() {
    return products;
  }
}
