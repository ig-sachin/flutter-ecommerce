import 'package:ecommerce/Pages/CartPage.dart';
import 'package:ecommerce/Pages/HomePage.dart';
import 'package:ecommerce/Pages/LoginPage.dart';
import 'package:ecommerce/Pages/SignInPage.dart';
import 'package:ecommerce/Pages/routes.dart';
import 'package:ecommerce/widgets/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
