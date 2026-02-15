import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            // Full screen gradient background
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Color(0xFFADF1AA)],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 8),
                  // Top banner image
                  Container(
                    width: 412.59,
                    height: 412,
                    color: Colors.orange.shade200,
                    child: Icon(Icons.store, color: Colors.white, size: 100),
                  ),
                  const SizedBox(height: 16),
                  // Category grid 2x2
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CategoryBox(
                              title: 'Groceries',
                              image: 'assets/images/category_fruit.jpg',
                              onTap: () => Navigator.of(context).pushNamed('/grocery'),
                            ),
                            CategoryBox(
                              title: 'Household',
                              image: 'assets/images/category_veg.jpg',
                              onTap: () => Navigator.of(context).pushNamed('/grocery'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CategoryBox(
                              title: 'Personal Care',
                              image: 'assets/images/category_grains.jpg',
                              onTap: () => Navigator.of(context).pushNamed('/grocery'),
                            ),
                            CategoryBox(
                              title: 'Stationery',
                              image: 'assets/images/category_oils.jpg',
                              onTap: () => Navigator.of(context).pushNamed('/grocery'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryBox extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const CategoryBox({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 179,
        height: 196,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000), // 25% black
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              width: 169,
              height: 95,
              decoration: BoxDecoration(
                color: Colors.green.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.category, color: Colors.white, size: 40),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 74,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'Discover',
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color(0xFF08CB00).withOpacity(0.55),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
