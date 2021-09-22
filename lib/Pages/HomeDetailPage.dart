import 'package:ecommerce/models/catalog.dart';
import 'package:ecommerce/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: MyTheme.creamColor,
        bottomNavigationBar: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red500.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  MyTheme.darkBluishColor,
                ),
                shape: MaterialStateProperty.all(
                  StadiumBorder(),
                ),
              ),
              child: "Buy".text.make(),
            ).wh(100, 50)
          ],
        ).p32(),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(
                  catalog.image,
                  height: 250,
                ),
              ),
              Expanded(
                child: VxArc(
                  height: 10,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.BOTTOM,
                  child: Container(
                    width: context.screenWidth,
                    color: Colors.white,
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(MyTheme.darkBluishColor)
                            .bold
                            .make(),
                        catalog.desc.text.make(),
                      ],
                    ).py16(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
