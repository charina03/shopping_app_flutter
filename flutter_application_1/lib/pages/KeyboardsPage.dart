import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/ProductDetailPage.dart';

class KeyboardsPage extends StatefulWidget {
  final Function(List<Map<String, String>>) updateFavorites;
  final List<Map<String, String>> favoriteProducts;
  final List<Map<String, String>> cartProducts;
  final Function(List<Map<String, String>>) updateCart;

  KeyboardsPage({
    required this.updateFavorites,
    required this.favoriteProducts,
    required this.cartProducts,
    required this.updateCart,
  });

  @override
  _KeyboardPageState createState() => _KeyboardPageState();
}

class _KeyboardPageState extends State<KeyboardsPage> {
  List<Map<String, String>> products = [
    {
      'image': '../assets/images/teclados/teclado1.jpg',
      'title': 'Keyboard 1',
      'description': 'Mechanical gaming keyboard with RGB lighting.',
      'price': '\$80',
    },
    {
      'image': '../assets/images/teclados/teclado2.webp',
      'title': 'Keyboard 2',
      'description': 'Ergonomic keyboard for office work.',
      'price': '\$40',
    },
    {
      'image': '../assets/images/teclados/teclado3.webp',
      'title': 'Keyboard 3',
      'description': 'Compact and portable keyboard for travel.',
      'price': '\$30',
    },
    {
      'image': '../assets/images/teclados/teclado4.webp',
      'title': 'Keyboard 4',
      'description': 'Wireless keyboard with long battery life.',
      'price': '\$50',
    },
    {
      'image': '../assets/images/teclados/teclado5.jpg',
      'title': 'Keyboard 5',
      'description': 'RGB mechanical keyboard with customizable keys.',
      'price': '\$90',
    },
    {
      'image': '../assets/images/teclados/teclado6.webp',
      'title': 'Keyboard 6',
      'description': 'Budget-friendly keyboard for casual users.',
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
        title: Text("Keyboards"),
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
                        "-20%",
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
