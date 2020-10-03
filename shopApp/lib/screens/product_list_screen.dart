import 'package:flutter/material.dart';
import 'package:shopApp/components/products_grid.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('product detail'),
        ),
        body: ProductsGrid());
  }
}
