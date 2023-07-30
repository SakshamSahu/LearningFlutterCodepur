import 'package:flutter_catalog/Models/catalog.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
