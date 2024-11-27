import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final Map<String, String> product;
  final int currentIndex;
  final List<Map<String, String>> products;

  ProductDetailPage({
    required this.product,
    required this.currentIndex,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['title']!),
        backgroundColor: Color(0xFF4C53A5),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                product['image']!,
                height: 300, // Tamaño grande
                width: 300,
              ),
              SizedBox(height: 20),
              Text(
                product['title']!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              ),
              SizedBox(height: 10),
              Text(
                product['description']!,
                style: TextStyle(fontSize: 18, color: Color(0xFF4C53A5)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                product['price']!,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              ),
              SizedBox(height: 30),
              // Fila de flechas para navegar entre los productos
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Color(0xFF4C53A5),
                    ),
                    onPressed: currentIndex > 0
                        ? () {
                            // Navegar al producto anterior
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailPage(
                                  product: products[currentIndex - 1],
                                  currentIndex: currentIndex - 1,
                                  products: products,
                                ),
                              ),
                            );
                          }
                        : null, // Deshabilitar si es el primer producto
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 30,
                      color: Color(0xFF4C53A5),
                    ),
                    onPressed: currentIndex < products.length - 1
                        ? () {
                            // Navegar al siguiente producto
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailPage(
                                  product: products[currentIndex + 1],
                                  currentIndex: currentIndex + 1,
                                  products: products,
                                ),
                              ),
                            );
                          }
                        : null, // Deshabilitar si es el último producto
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
