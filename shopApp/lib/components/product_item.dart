import 'package:flutter/material.dart';
import 'package:shopApp/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({@required this.product});

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.red, width: 1)),
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
    ));
  }
}
