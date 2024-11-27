import 'package:badges/badges.dart' as B;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/CartPage.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Map<String, String>> favoriteProducts; // Recibe la lista de favoritos

  // Constructor para recibir la lista de favoritos
  HomeAppBar({required this.favoriteProducts});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.sort,
          size: 30,
          color: Color(0xFF4C53A5),
        ),
        onPressed: () {},
      ),
      title: Text(
        "C.G Shop",
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: Color(0xFF4C53A5),
        ),
      ),
      actions: [
        // Badge con contador de favoritos
        B.Badge(
          badgeContent: Text(
            "${favoriteProducts.length}",
            style: TextStyle(color: Colors.white),
          ),
          badgeStyle: B.BadgeStyle(
            badgeColor: Colors.red,
          ),
          position: B.BadgePosition.topEnd(top: 0, end: 1),
          child: IconButton(
            icon: Icon(
              Icons.favorite_outline,
              size: 30,
              color: Color(0xFF4C53A5),
            ),
            onPressed: () {
              // Cuando se hace clic en la bolsa, navegar a la vista de favoritos
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(
                    favoriteProducts: favoriteProducts, // Pasamos la lista de favoritos a CartPage
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Especifica el tamaño del AppBar
}
