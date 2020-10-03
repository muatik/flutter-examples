import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopApp/providers/product.dart';

class ProductsGridItem extends StatelessWidget {
  final Function onTab;

  final onAddChart;

  final onFav;

  ProductsGridItem({this.onTab, this.onAddChart, this.onFav});

  @override
  Widget build(BuildContext context) {
    Product product = Provider.of<Product>(context);
    return GestureDetector(
      onTap: onTab,
      child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: IconButton(icon: Icon(Icons.favorite), onPressed: null),
            trailing:
                IconButton(icon: Icon(Icons.shopping_cart), onPressed: null),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
          ),
          child: Container(
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
