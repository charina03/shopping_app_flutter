import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, String>> favoriteProducts;

  CartPage({required this.favoriteProducts});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
        backgroundColor: Color(0xFF4C53A5),
      ),
      body: widget.favoriteProducts.isEmpty
          ? Center(child: Text('No tienes productos favoritos.'))
          : ListView.builder(
              itemCount: widget.favoriteProducts.length,
              itemBuilder: (context, index) {
                final product = widget.favoriteProducts[index];
                return CartItem(
                  product: product,
                  onDelete: () {
                    setState(() {
                      widget.favoriteProducts.removeAt(index);
                    });
                  },
                );
              },
            ),
    );
  }
}

class CartItem extends StatefulWidget {
  final Map<String, String> product;
  final VoidCallback onDelete;

  CartItem({required this.product, required this.onDelete});

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Agregar un poco de espacio entre elementos
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // Sombra para el contenedor
              ),
            ],
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                widget.product['image']!,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(widget.product['title']!),
            subtitle: Text(widget.product['price']!),
            trailing: _isHovered
                ? IconButton(
                    icon: Icon(Icons.delete, color: Color(0xFF4C53A5)),
                    onPressed: widget.onDelete,
                  )
                : null, // El icono solo se muestra cuando _isHovered es true
          ),
        ),
      ),
    );
  }
}
