import 'package:flutter/material.dart';

class ItemsWidget extends StatefulWidget {
  final Function(List<Map<String, String>>) updateFavorites;

  ItemsWidget({required this.updateFavorites});

  @override
  _ItemsWidgetState createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  List<Map<String, String>> products = [
    {
      'image': '../assets/images/1.jpg',
      'title': 'Product 1',
      'description': 'Description for Product 1',
      'price': '\$55',
    },
    {
      'image': '../assets/images/2.jpg',
      'title': 'Product 2',
      'description': 'Description for Product 2',
      'price': '\$45',
    },
    {
      'image': '../assets/images/3.jpg',
      'title': 'Product 3',
      'description': 'Description for Product 3',
      'price': '\$35',
    },
    {
      'image': '../assets/images/4.jpg',
      'title': 'Product 4',
      'description': 'Description for Product 4',
      'price': '\$25',
    },
    {
      'image': '../assets/images/5.jpg',
      'title': 'Product 5',
      'description': 'Description for Product 5',
      'price': '\$65',
    },
    {
      'image': '../assets/images/6.jpg',
      'title': 'Product 6',
      'description': 'Description for Product 6',
      'price': '\$75',
    },
  ];

  List<Map<String, String>> favoriteProducts = [];

  void toggleFavorite(Map<String, String> product) {
    setState(() {
      if (favoriteProducts.contains(product)) {
        favoriteProducts.remove(product);
      } else {
        favoriteProducts.add(product);
      }
    });

    // Actualiza los favoritos en la página principal
    widget.updateFavorites(favoriteProducts);
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
                      favoriteProducts.contains(product)
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
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    product['image']!,
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
                    Icon(
                      Icons.shopping_cart_checkout,
                      color: Color(0xFF4C53A5),
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
