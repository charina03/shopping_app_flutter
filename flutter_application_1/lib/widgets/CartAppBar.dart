import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF4C53A5),
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Color(0xFF4C53A5),
        ),
        onPressed: () {
          Navigator.pop(context); // Regresar a la página anterior
        },
      ),
      title: Text(
        "Favoritos",
        style: TextStyle(
          color: Color(0xFF4C53A5),
          fontWeight: FontWeight.bold,
          fontSize: 20,
          
        ),
      ),
    );
  }
}
