import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopApp/providers/cart.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: null,
        child: Stack(alignment: Alignment.center, children: [
          Icon(Icons.shopping_cart),
          Container(
              margin: EdgeInsets.only(top: 20, left: 20),
              padding: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.red, width: 1)),
              child: Consumer<Cart>(
                  builder: (ctx, cart, child) =>
                      Text(cart.count().toString()))),
        ]));
  }
}
