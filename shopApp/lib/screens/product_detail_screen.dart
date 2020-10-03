import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopApp/components/product_detail.dart';
import 'package:shopApp/providers/product.dart';
import 'package:shopApp/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String productId = (ModalRoute.of(context).settings.arguments
        as Map<String, String>)['id'];
    Product product =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: ChangeNotifierProvider.value(
        value: product,
        child: ProductDetail(),
      ),
    );
  }
}
