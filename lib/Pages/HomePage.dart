import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/Pages/routes.dart';
import 'package:ecommerce/models/DataSearch.dart';
import 'package:ecommerce/models/catalog.dart';
import 'package:ecommerce/widgets/HomeWidgets/CatalogHeader.dart';
import 'package:ecommerce/widgets/HomeWidgets/CatalogList.dart';
import 'package:ecommerce/widgets/HomeWidgets/CustomCarousel.dart';
import 'package:flutter/cupertino.dart';
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
    await Future.delayed(Duration(milliseconds: 500));
    var productsData = decodedData['products'];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).buttonColor,
      ),
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Search Here",
              border: InputBorder.none,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: DataSearch(),
                );
              })
        ],
      ),
      drawer: Drawer(),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: [
                  CustomCarousel(
                    image:
                        "https://images.unsplash.com/photo-1563013544-824ae1b704d3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZWNvbW1lcmNlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                    title: "Laptop's",
                  ),
                  CustomCarousel(
                    image:
                        "https://images.unsplash.com/photo-1605902711622-cfb43c4437b5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8ZWNvbW1lcmNlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                    title: "Mobile's",
                  ),
                  CustomCarousel(
                    image:
                        "https://images.unsplash.com/photo-1512729343400-4fcf83a18f72?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGVjb21tZXJjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                    title: "Buy you big TV",
                  ),
                  CustomCarousel(
                    image:
                        "https://images.unsplash.com/photo-1460925895917-afdab827c52f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGVjb21tZXJjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                    title: "HP Laptops",
                  ),
                  CustomCarousel(
                    image:
                        "https://media.istockphoto.com/photos/man-using-mobile-smart-phone-with-global-network-connection-and-picture-id1274394138?b=1&k=20&m=1274394138&s=170667a&w=0&h=DTMn7Vg-lHFiz3yuo1O1EUQYIYQ6Wx4RmQn0buuoOGs=",
                    title: "AI Products",
                  ),
                ],
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
