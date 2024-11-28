import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/ProductDetailPage.dart';


class ItemsWidget extends StatefulWidget {
  final Function(List<Map<String, String>>) updateFavorites;
  final List<Map<String, String>> favoriteProducts;
  final List<Map<String, String>> cartProducts; // Lista de productos en el carrito
  final Function(List<Map<String, String>>) updateCart; // Callback para actualizar el carrito

  ItemsWidget({
    required this.updateFavorites,
    required this.favoriteProducts,
    required this.cartProducts,
    required this.updateCart, // Recibimos el callback para actualizar el carrito
  });

  @override
  _ItemsWidgetState createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  List<Map<String, String>> products = [
    {
      'image': '../assets/images/laptops/laptop1.jpg', // Ruta corregida
      'title': 'Product 1',
      'description': 'Description for Product 1',
      'price': '\$55',
    },
    {
      'image': '../assets/images/2.jpg', // Ruta corregida
      'title': 'Product 2',
      'description': 'Description for Product 2',
      'price': '\$45',
    },
    {
      'image': '../assets/images/3.jpg', // Ruta corregida
      'title': 'Product 3',
      'description': 'Description for Product 3',
      'price': '\$35',
    },
    {
      'image': '../assets/images/4.jpg', // Ruta corregida
      'title': 'Product 4',
      'description': 'Description for Product 4',
      'price': '\$25',
    },
    {
      'image': '../assets/images/5.jpg', // Ruta corregida
      'title': 'Product 5',
      'description': 'Description for Product 5',
      'price': '\$65',
    },
    {
      'image': '../assets/images/6.jpg', // Ruta corregida
      'title': 'Product 6',
      'description': 'Description for Product 6',
      'price': '\$75',
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
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.68,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
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
    );
  }
}
