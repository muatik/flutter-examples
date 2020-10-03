import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopApp/providers/product.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return Column(children: [
      Text(product.price.toString()),
      RaisedButton(onPressed: () {
        product.increasePrice();
      })
    ]);
  }
}
