import 'package:flutter/material.dart';
import 'package:shopApp/components/cart_button.dart';
import 'package:shopApp/components/products_grid.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  bool onlyFavs = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('product detail'),
          actions: [buildChartButton(), buildPopupMenuButton()],
        ),
        body: ProductsGrid(onlyFavs));
  }

  Widget buildPopupMenuButton() {
    return PopupMenuButton(
        onSelected: (selected) {
          setState(() {
            onlyFavs = selected == 1;
          });
        },
        itemBuilder: (context) => [
              PopupMenuItem(child: Text('All'), value: 0),
              PopupMenuItem(child: Text('Only favs'), value: 1),
            ]);
  }

  Widget buildChartButton() {
    return CartButton();
  }
}
