import 'package:flutter/material.dart';
import 'package:shopApp/components/product_item.dart';
import 'package:shopApp/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> products = Product.findAll();
    return Scaffold(
        appBar: AppBar(
          title: Text('product detail'),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: products.length,
            itemBuilder: (context, index) => ProductItem(
                  product: products[index],
                )));
  }
}
