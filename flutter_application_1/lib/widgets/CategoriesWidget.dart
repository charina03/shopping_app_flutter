import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/LaptosPage.dart';
import 'package:flutter_application_1/pages/MousePage.dart';
import 'package:flutter_application_1/pages/KeyboardsPage.dart';
import 'package:flutter_application_1/pages/HeadphonePage.dart';  // Importa HeadphonePage

class CategoriesWidget extends StatelessWidget {
  final Function(List<Map<String, String>>) updateFavorites;
  final List<Map<String, String>> favoriteProducts;
  final List<Map<String, String>> cartProducts;
  final Function(List<Map<String, String>>) updateCart;

  CategoriesWidget({
    required this.updateFavorites,
    required this.favoriteProducts,
    required this.cartProducts,
    required this.updateCart,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // Contenedor 1: Laptops
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LaptopsPage(
                    updateFavorites: updateFavorites,
                    favoriteProducts: favoriteProducts,
                    cartProducts: cartProducts,
                    updateCart: updateCart,
                  ),
                ),
              );
            },
            child: Container(
              key: Key("laptops"),
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "../assets/images/laptops/laptop1.jpg",
                    width: 40,
                    height: 40,
                  ),
                  Text(
                    "Laptops",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Contenedor 2: Mouse
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MousePage(
                    updateFavorites: updateFavorites,
                    favoriteProducts: favoriteProducts,
                    cartProducts: cartProducts,
                    updateCart: updateCart,
                  ),
                ),
              );
            },
            child: Container(
              key: Key("mouse"),
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "../assets/images/mouse/mouse1.jpg",
                    width: 40,
                    height: 40,
                  ),
                  Text(
                    "Mouse",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Contenedor 3: Keyboards
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KeyboardsPage(
                    updateFavorites: updateFavorites,
                    favoriteProducts: favoriteProducts,
                    cartProducts: cartProducts,
                    updateCart: updateCart,
                  ),
                ),
              );
            },
            child: Container(
              key: Key("keyboards"),
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "../assets/images/teclados/teclado1.jpg",
                    width: 40,
                    height: 40,
                  ),
                  Text(
                    "Keyboards",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Contenedor 4: Headphones
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HeadphonePage(
                    updateFavorites: updateFavorites,
                    favoriteProducts: favoriteProducts,
                    cartProducts: cartProducts,
                    updateCart: updateCart,
                  ),
                ),
              );
            },
            child: Container(
              key: Key("headphones"),
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "../assets/images/auriculares/auricular1.jpg",
                    width: 40,
                    height: 40,
                  ),
                  Text(
                    "Headphones",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
