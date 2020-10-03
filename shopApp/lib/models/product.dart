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

  static final List<Product> _products = [
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
    Product(
        id: 'id4',
        title: 'Product 4',
        description: 'product 4 description',
        price: 39,
        imageUrl:
            'https://images.unsplash.com/photo-1556774687-0e2fdd0116c0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1489&q=80'),
    Product(
        id: 'id5',
        title: 'Product 5',
        description: 'product 5 description',
        price: 39,
        imageUrl:
            'https://images.unsplash.com/photo-1545289414-1c3cb1c06238?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80'),
    Product(
        id: 'id6',
        title: 'Product 6',
        description: 'product 6 description',
        price: 39,
        imageUrl:
            'https://images.unsplash.com/photo-1595461135849-bf08893fdc2c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1498&q=80'),
    Product(
        id: 'id7',
        title: 'Product 7',
        description: 'product 7 description',
        price: 39,
        imageUrl:
            'https://images.unsplash.com/photo-1594100065556-1c920cd92f19?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80'),
    Product(
        id: 'id8',
        title: 'Product 8',
        description: 'product 7 description',
        price: 39,
        imageUrl:
            'https://images.unsplash.com/photo-1559734828-36beac6c9586?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=621&q=80'),
    Product(
        id: 'id9',
        title: 'Product 9',
        description: 'product 7 description',
        price: 39,
        imageUrl:
            'https://images.unsplash.com/photo-1577106436954-eb29e215beff?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80'),
  ];

  static List<Product> findAll() {
    return [..._products];
  }

  static Product findById(String id) {
    return _products.firstWhere((element) => element.id == id);
  }
}
