import 'package:flutter/material.dart';
import 'package:shopApp/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  final Function onTab;

  final onAddChart;

  final onFav;

  ProductItem(
      {@required this.product, this.onTab, this.onAddChart, this.onFav});

  @override
  Widget build(BuildContext context) {
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
