import 'package:ecommerce/models/catalog.dart';
import 'package:ecommerce/widgets/ItemWidget.dart';
import 'package:ecommerce/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
