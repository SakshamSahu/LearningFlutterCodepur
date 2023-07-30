import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/Models/cart.dart';
import 'package:flutter_catalog/Models/catalog.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    super.key,
    required this.catalog,
  });

  final CartModel _cart = (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Theme.of(context).floatingActionButtonTheme.backgroundColor),
          shape: MaterialStateProperty.all(const StadiumBorder())),
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
