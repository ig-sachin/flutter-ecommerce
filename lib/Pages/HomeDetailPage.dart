import 'package:ecommerce/models/catalog.dart';
import 'package:ecommerce/widgets/HomeWidgets/AddToCart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: context.canvasColor,
        bottomNavigationBar: Container(
          color: context.cardColor,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.bold.xl4.red500.make(),
              AddToCart(catalog: catalog),
            ],
          ).p32(),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(
                  catalog.image,
                  height: 200,
                ),
              ),
              Expanded(
                child: VxArc(
                  height: 10,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.BOTTOM,
                  child: Container(
                    width: context.screenWidth,
                    color: context.cardColor,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          catalog.name.text.xl4
                              .color(context.accentColor)
                              .bold
                              .make(),
                          catalog.desc.text.xl.make(),
                          "Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio at magni voluptates minus quam, animi consequuntur eius maiores ullam cum perspiciatis perferendis officia quo modi suscipit numquam enim eligendi cupiditate! Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio at magni voluptates minus quam, animi consequuntur eius maiores ullam cum perspiciatis perferendis officia quo modi suscipit numquam enim eligendi cupiditate"
                              .text
                              .make()
                              .p16(),
                        ],
                      ).py16(),
                    ),
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
