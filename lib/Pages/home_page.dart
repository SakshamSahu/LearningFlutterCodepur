// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_catalog/Models/catalog.dart';
import 'package:flutter_catalog/Widgets/drawer.dart';

import '../Widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final int days = 30;
  final String name = "codepur";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.items[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
