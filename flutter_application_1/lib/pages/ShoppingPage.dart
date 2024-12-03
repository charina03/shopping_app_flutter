import 'package:flutter/material.dart';

class ShoppingPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartProducts; // Ahora 'cartProducts' puede contener más información (como cantidad)

  ShoppingPage({required this.cartProducts});

  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  // Variable para controlar si el cursor está sobre el producto
  List<bool> _isHovering = [];

  // Método para eliminar un producto del carrito
  void removeProduct(int index) {
    setState(() {
      widget.cartProducts.removeAt(index); // Eliminamos el producto de la lista
    });
  }

  // Método para calcular el total del carrito
  double calculateTotal() {
    double total = 0.0;
    for (var product in widget.cartProducts) {
      double price = double.tryParse(product['price']!.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
      int quantity = product['quantity'] ?? 1; // Usamos '1' como valor predeterminado si no se encuentra la cantidad
      total += price * quantity; // Multiplicamos precio por cantidad y sumamos al total
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compras'),
        backgroundColor: Color(0xFF4C53A5),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartProducts.length,
              itemBuilder: (context, index) {
                final product = widget.cartProducts[index];

                // Inicializamos el estado del hover para cada producto
                if (_isHovering.length <= index) {
                  _isHovering.add(false);
                }

                return MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      _isHovering[index] = true; // Mostrar el botón de eliminar cuando el cursor entra
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      _isHovering[index] = false; // Ocultar el botón de eliminar cuando el cursor sale
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Imagen del producto
                        Image.asset(
                          product['image']!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10),

                        // Título y precio del producto
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['title']!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                product['price']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Muestra el botón de eliminar solo si el cursor está sobre el producto
                        if (_isHovering[index])
                          IconButton(
                            icon: Icon(Icons.delete, color: Color(0xFF4C53A5)),
                            onPressed: () {
                              // Eliminar el producto del carrito
                              removeProduct(index);
                            },
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Fila para mostrar el total del carrito
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C53A5),
                  ),
                ),
                Text(
                  '\$${calculateTotal().toStringAsFixed(2)}', // Formateamos el total a dos decimales
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C53A5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
