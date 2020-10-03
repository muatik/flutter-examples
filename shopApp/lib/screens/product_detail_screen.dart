import 'package:flutter/material.dart';
import 'package:shopApp/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String productId = (ModalRoute.of(context).settings.arguments
        as Map<String, String>)['id'];
    Product product = Product.findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
