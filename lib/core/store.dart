import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/Models/cart.dart';
import 'package:flutter_catalog/Models/catalog.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
