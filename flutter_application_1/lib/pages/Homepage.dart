import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/DeviceCarePage.dart';
import 'package:flutter_application_1/pages/ShoppingPage.dart';
import 'package:flutter_application_1/widgets/HomeAppBar.dart';
import '../widgets/CategoriesWidget.dart';
import '../widgets/ItemsWidget.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Lista para mantener los productos favoritos
  List<Map<String, String>> favoriteProducts = [];

  // Lista para mantener los productos en el carrito
  List<Map<String, String>> cartProducts = [];

  // Función para actualizar los favoritos
  void updateFavorites(List<Map<String, String>> newFavorites) {
    setState(() {
      favoriteProducts = newFavorites;
    });
  }

  // Función para actualizar el carrito
  void updateCart(List<Map<String, String>> newCart) {
    setState(() {
      cartProducts = newCart;
    });
  }

  // Índice actual de la barra de navegación
  int _selectedIndex = 0;

  // Función para cambiar la página activa
  void onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(favoriteProducts: favoriteProducts),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // Página inicial (Home)
          ListView(
            children: [
              Container(
                padding: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: Color(0xFFEDECF2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    // Barra de búsqueda
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          // Campo de texto para buscar
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            height: 50,
                            width: 300,
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "buscar aquí...",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Categorías
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Text(
                        "Categorias",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                    ),

                    // Widget de categorías
                    CategoriesWidget(
                      updateFavorites: updateFavorites, // Pasamos la función para actualizar los favoritos
                      favoriteProducts: favoriteProducts, // Lista de productos favoritos
                      cartProducts: cartProducts, // Lista de productos en el carrito
                      updateCart: updateCart, // Pasamos la función para actualizar el carrito
                    ),

                    // Título para "Best Selling"
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Text(
                        "Más vendidos",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                    ),

                    // Widget de items
                    ItemsWidget(
                      updateFavorites: updateFavorites,
                      favoriteProducts: favoriteProducts,
                      cartProducts: cartProducts, // Pasamos la lista de productos en el carrito
                      updateCart: updateCart, // Pasamos la función para actualizar el carrito
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Página del carrito
          ShoppingPage(
            cartProducts: cartProducts,
          ),

          DeviceCarePage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) {
          onNavItemTapped(index);
        },
        height: 70,
        color: Color(0xFF4C53A5),
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_cart_checkout,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
