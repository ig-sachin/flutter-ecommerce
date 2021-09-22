import 'package:ecommerce/models/catalog.dart';
import 'package:ecommerce/widgets/HomeWidgets/CatalogHeader.dart';
import 'package:ecommerce/widgets/HomeWidgets/CatalogList.dart';
import 'package:ecommerce/widgets/ItemWidget.dart';
import 'package:ecommerce/widgets/drawer.dart';
import 'package:ecommerce/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJosn = await rootBundle.loadString("files/catalog.json");
    final decodedData = jsonDecode(catalogJosn);
    var productsData = decodedData['products'];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                Center(
                  child: CircularProgressIndicator().centered().expand(),
                )
            ],
          ),
        ),
      ),
    );
  }
}
