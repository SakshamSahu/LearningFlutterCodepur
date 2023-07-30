// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors
import 'dart:convert';
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/Models/cart.dart';
import 'package:flutter_catalog/Utils/routes.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/Models/catalog.dart';
import '../Widgets/home_widgets/catalog_header.dart';
import '../Widgets/home_widgets/catalog_list.dart';
//mport 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "codepur";
  final url = "https://api.jsonbin.io/v3/b/64c616f2b89b1e2299c84c22";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    final productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: Theme.of(context)
            .canvasColor, //you can use "context.cardcolor" if using velocity_x.
        floatingActionButton: VxBuilder(
          builder: (context, store, status) {
            return FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
              child: Icon(
                CupertinoIcons.cart,
                color: Colors.white,
              ),
            ).badge(
                color: Vx.red500,
                size: 22,
                count: cart.items.length,
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black));
          },
          mutations: const {AddMutation, RemoveMutation},
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null &&
                    CatalogModel.items!.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
