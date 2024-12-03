import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/ProductDetailPage.dart';

class LaptopsPage extends StatefulWidget {
  final Function(List<Map<String, String>>) updateFavorites;
  final List<Map<String, String>> favoriteProducts;
  final List<Map<String, String>> cartProducts;
  final Function(List<Map<String, String>>) updateCart;

  LaptopsPage({
    required this.updateFavorites,
    required this.favoriteProducts,
    required this.cartProducts,
    required this.updateCart,
  });

  @override
  _LaptopsPageState createState() => _LaptopsPageState();
}

class _LaptopsPageState extends State<LaptopsPage> {
  List<Map<String, String>> products = [
    {
      'image': '../assets/images/laptops/laptop1.jpg',
      'title': 'HP Spectre x360',
      'description': 'Intel Core i7 12ª generación, 16GB RAM y un SSD 1TB.',
      'price': '\$20,000',
    },
    {
      'image': '../assets/images/laptops/laptop2.webp',
      'title': 'HP Pavilion 15-dg1000',
      'description': 'Ultrabook para trabajar y estudiar.',
      'price': '\$10,000',
    },
    {
      'image': '../assets/images/laptops/laptop3.jpeg',
      'title': 'Razer Nitro',
      'description': 'Portátil económico con excelentes funciones.',
      'price': '\$30,000',
    },
    {
      'image': '../assets/images/laptops/laptop4.png',
      'title': 'Lenovo IdeaPad',
      'description': '2-en-1 laptop convertible.',
      'price': '\$33,000',
    },
    {
      'image': '../assets/images/laptops/laptop5.jpg',
      'title': 'Huawei MateBook Pro',
      'description': 'Portátil con batería de larga duración.',
      'price': '\$18,900',
    },
    {
      'image': '../assets/images/laptops/laptop6.jpg',
      'title': 'HP 15-da0000',
      'description': 'Laptop con pantalla de alta resolución.',
      'price': '\$15,200',
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
        content: Text('${product['title']} añadido al carrito!'),
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
        title: Text("Laptops"),
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
