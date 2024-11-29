import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/ProductDetailPage.dart';

class MousePage extends StatefulWidget {
  final Function(List<Map<String, String>>) updateFavorites;
  final List<Map<String, String>> favoriteProducts;
  final List<Map<String, String>> cartProducts;
  final Function(List<Map<String, String>>) updateCart;

  MousePage({
    required this.updateFavorites,
    required this.favoriteProducts,
    required this.cartProducts,
    required this.updateCart,
  });

  @override
  _MousePageState createState() => _MousePageState();
}

class _MousePageState extends State<MousePage> {
  List<Map<String, String>> products = [
    {
      'image': '../assets/images/mouse/mouse1.jpg',
      'title': 'Mouse 1',
      'description': 'High-precision gaming mouse.',
      'price': '\$50',
    },
    {
      'image': '../assets/images/mouse/mouse2.jpg',
      'title': 'Mouse 2',
      'description': 'Ergonomic wireless mouse for office work.',
      'price': '\$25',
    },
    {
      'image': '../assets/images/mouse/mouse3.jpg',
      'title': 'Mouse 3',
      'description': 'Budget mouse with great functionality.',
      'price': '\$15',
    },
    {
      'image': '../assets/images/mouse/mouse4.jpg',
      'title': 'Mouse 4',
      'description': 'RGB gaming mouse with adjustable DPI.',
      'price': '\$40',
    },
    {
      'image': '../assets/images/mouse/mouse5.jpg',
      'title': 'Mouse 5',
      'description': 'Wireless mouse with rechargeable battery.',
      'price': '\$35',
    },
    {
      'image': '../assets/images/mouse/mouse6.jpg',
      'title': 'Mouse 6',
      'description': 'Compact mouse for travel and portability.',
      'price': '\$20',
    },
  ];

  // Método para añadir un producto al carrito
  void addToCart(Map<String, String> product) {
    setState(() {
      if (!widget.cartProducts.contains(product)) {
        widget.cartProducts.add(product); // Añadimos el producto al carrito
      }
    });

    // Actualizamos el carrito en la página principal
    widget.updateCart(widget.cartProducts);

    // Mostrar el SnackBar de confirmación
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product['title']} added to cart!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  // Método para agregar o quitar un producto de los favoritos
  void toggleFavorite(Map<String, String> product) {
    setState(() {
      if (widget.favoriteProducts.contains(product)) {
        widget.favoriteProducts.remove(product); // Eliminar si ya está en favoritos
      } else {
        widget.favoriteProducts.add(product); // Agregar si no está en favoritos
      }
    });

    // Actualiza los favoritos en la página principal
    widget.updateFavorites(widget.favoriteProducts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mouses"),
        backgroundColor: Color(0xFF4C53A5),
      ),
      body: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Definir el número de columnas
          childAspectRatio: 0.68, // Ajustar el aspecto del grid
          crossAxisSpacing: 10, // Espacio horizontal entre elementos
          mainAxisSpacing: 10, // Espacio vertical entre elementos
        ),
        // Eliminamos NeverScrollableScrollPhysics para permitir el scroll
        physics: BouncingScrollPhysics(),
        shrinkWrap: true, // Permite que el GridView ocupe solo el espacio necesario
        itemBuilder: (context, index) {
          final product = products[index];

          return Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xFF4C53A5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "-50%",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        widget.favoriteProducts.contains(product)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        toggleFavorite(product);
                      },
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    // Navegar al detalle del producto cuando se toque la imagen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: product,
                          currentIndex: index,
                          products: products,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Image.asset(
                      product['image']!, // Asignamos la ruta de la imagen
                      height: 140,
                      width: 140,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product['title']!,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF4C53A5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product['description']!,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product['price']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart_checkout,
                          color: Color(0xFF4C53A5),
                        ),
                        onPressed: () {
                          addToCart(product); // Añadir al carrito
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
