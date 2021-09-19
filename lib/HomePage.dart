import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double days = 9999.777;
    String name = "Welcome to", name2 = "Flutterr";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
        ),
      ),
      body: Center(
        child: Container(
          child: Text("$name $days $name2"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
