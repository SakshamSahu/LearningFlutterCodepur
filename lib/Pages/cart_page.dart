import 'package:flutter/material.dart';
import 'package:flutter_catalog/Models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.canvasColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "Cart".text.make(),
        ),
        body: const Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            Divider(),
            _CartTotal(),
          ],
        ));
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "\$${_cart.totalPrice}",
            style: TextStyle(
              fontSize: 40.0,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const WidthBox(30.0),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    " Buying not supported yet. ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Theme.of(context)
                    .floatingActionButtonTheme
                    .backgroundColor)),
            child: const Text(
              "Buy",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {},
        ),
        title: Text(_cart.items[index].name),
      ),
    );
  }
}
