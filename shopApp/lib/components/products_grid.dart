import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopApp/components/products_grid_item.dart';
import 'package:shopApp/providers/product.dart';
import 'package:shopApp/providers/products.dart';

import '../routes.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<Products>(context).findAll();
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: products.length,
        itemBuilder: (context, index) =>
            buildProductItem(context, products[index]));
  }

  Widget buildProductItem(BuildContext context, Product product) {
    return ChangeNotifierProvider.value(
        value: product,
        child: ProductsGridItem(
          onTab: () => onProductItemTab(context, product.id),
        ));
  }

  onProductItemTab(BuildContext context, String id) {
    return Navigator.of(context)
        .pushNamed(ROUTE_PRODUCT_DETAIL, arguments: {'id': id});
  }
}
