import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/CartPage.dart';
import 'package:flutter_application_1/pages/Homepage.dart';
import 'package:flutter_application_1/pages/ShoppingPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        "/": (context) => Homepage(),
        "cartPage": (context) => CartPage(favoriteProducts: [],),
        "shoppingPage": (context) => ShoppingPage(cartProducts: [],),
      },
    );
  }
}
