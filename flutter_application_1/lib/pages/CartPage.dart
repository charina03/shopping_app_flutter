import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/CartAppBar.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: ListView(
        children: [
          CartAppBar(),
        ],
      ),
    );
  }
  
}