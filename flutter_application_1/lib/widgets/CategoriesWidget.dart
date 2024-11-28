import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/LaptosPage.dart';


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
          // Contenedor 1: Laptops (con navegación)
          GestureDetector(
            onTap: () {
              // Navegar a la página de Laptops cuando se haga clic
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LaptopsPage(
                    updateFavorites: updateFavorites, // Lógica para actualizar favoritos
                    favoriteProducts: favoriteProducts, // Lista de productos favoritos
                    cartProducts: cartProducts, // Lista de productos en el carrito
                    updateCart: updateCart, // Lógica para actualizar el carrito
                  ), // Redirige a la página Laptops
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
              // Lógica para navegar a la página de Mouse
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
                    "../assets/images/2.jpg",
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
              // Lógica para navegar a la página de Keyboards
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
                    "../assets/images/3.jpg",
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
              // Lógica para navegar a la página de Headphones
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
                    "../assets/images/4.jpg",
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

          // Otros contenedores (Mouse, Keyboards, etc.)
        ],
      ),
    );
  }
}
