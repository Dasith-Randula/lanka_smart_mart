import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class GroceryListPage extends StatelessWidget {
  const GroceryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Color(0xFFADF1AA)],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 8),
                  // Top image
                  Container(
                    width: 411,
                    height: 274,
                    color: Colors.green.shade200,
                    child: Icon(Icons.image, color: Colors.white, size: 50),
                  ),
                  const SizedBox(height: 12),
                  // Horizontal category frame
                  SizedBox(
                    width: 408,
                    height: 93,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        width: 590,
                        height: 93,
                        color: Colors.white,
                        child: Row(
                          children: const <Widget>[
                            SizedBox(width: 12),
                            GroceryCategory(name: 'Fruits', image: 'assets/images/category_fruit.jpg'),
                            SizedBox(width: 12),
                            GroceryCategory(name: 'Vegetables', image: 'assets/images/category_veg.jpg'),
                            SizedBox(width: 12),
                            GroceryCategory(name: 'Food Grains', image: 'assets/images/category_grains.jpg'),
                            SizedBox(width: 12),
                            GroceryCategory(name: 'Oils and Gee', image: 'assets/images/category_oils.jpg'),
                            SizedBox(width: 12),
                            GroceryCategory(name: 'Masala', image: 'assets/images/category_masala.jpg'),
                            SizedBox(width: 12),
                            GroceryCategory(name: 'Meat Items', image: 'assets/images/category_meat.jpg'),
                            SizedBox(width: 12),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Latest box
                  Container(
                    width: 412,
                    height: 306,
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFDFDFDF)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Latest',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: GridView.count(
                              crossAxisCount: 3,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              childAspectRatio: 97 / 119,
                              physics: const NeverScrollableScrollPhysics(),
                              children: <Widget>[
                                LatestItem(name: 'Red Apple', image: 'assets/images/item_red_apple.jpg', onTapRoute: '/item'),
                                LatestItem(name: 'Broccoli', image: 'assets/images/item_broccoli.jpg'),
                                LatestItem(name: 'Eggs', image: 'assets/images/item_eggs.jpg'),
                                LatestItem(name: 'Onion', image: 'assets/images/item_onion.jpg'),
                                LatestItem(name: 'Prawns', image: 'assets/images/item_prawns.jpg'),
                                LatestItem(name: 'Coconut', image: 'assets/images/item_coconut.jpg'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Bottom image
                  Container(
                    width: 412,
                    height: 125,
                    color: Colors.blue.shade200,
                    child: Icon(Icons.image, color: Colors.white, size: 30),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GroceryCategory extends StatelessWidget {
  final String name;
  final String image;

  const GroceryCategory({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.56,
      height: 75,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 37.28,
            backgroundColor: Colors.green.shade200,
            child: Icon(Icons.category, color: Colors.white),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 80.56,
            child: Text(
              name,
              style: const TextStyle(fontSize: 12, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class LatestItem extends StatelessWidget {
  final String name;
  final String image;
  final String? onTapRoute;

  const LatestItem({super.key, required this.name, required this.image, this.onTapRoute});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapRoute != null ? () => Navigator.of(context).pushNamed(onTapRoute!) : null,
      child: Container(
        width: 97,
        height: 119,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF08CB00)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 97,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.shopping_cart, color: Colors.green, size: 40),
            ),
            const SizedBox(height: 6),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
