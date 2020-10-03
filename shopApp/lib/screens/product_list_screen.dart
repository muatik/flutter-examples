import 'package:flutter/material.dart';
import 'package:shopApp/components/product_item.dart';
import 'package:shopApp/models/product.dart';
import 'package:shopApp/routes.dart';

class ProductListScreen extends StatelessWidget {
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
                  onTab: () => onProductTab(context, products[index].id),
                  product: products[index],
                )));
  }

  onProductTab(BuildContext context, String id) {
    Navigator.of(context)
        .pushNamed(ROUTE_PRODUCT_DETAIL, arguments: {'id': id});
  }
}
