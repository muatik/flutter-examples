import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopApp/providers/cart.dart';
import 'package:shopApp/providers/product.dart';

class ProductsGridItem extends StatelessWidget {
  final Function onTab;

  final onAddChart;

  final onFav;

  ProductsGridItem({this.onTab, this.onAddChart, this.onFav});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);

    return GestureDetector(
      onTap: onTab,
      child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: IconButton(icon: Icon(Icons.favorite), onPressed: null),
            trailing: buildCartButton(product, cart),
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

  Widget buildCartButton(Product product, Cart cart) {
    final isInCart = cart.contains(product.id);
    return IconButton(
        icon: Icon(Icons.shopping_cart,
            color: isInCart ? Colors.orange : Colors.white),
        onPressed: () => addToCart(product, cart));
  }

  addToCart(Product product, Cart cart) {
    cart.add(CartItem.from(product, 1));
  }
}
