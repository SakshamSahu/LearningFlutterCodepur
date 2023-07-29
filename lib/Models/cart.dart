import 'package:flutter_catalog/Models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  //catalog field
  CatalogModel? _catalog;
  // CartModel(this._catalog);

  //collection of ID's: Store Id's of each item
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => _catalog!;

  //set catalog
  set catalog(CatalogModel newcatalog) {
    _catalog = newcatalog;
  }

  //get items in the cart
  List<Item> get items =>
      _itemIds.map((id) => _catalog!.getById(id)).whereType<Item>().toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
