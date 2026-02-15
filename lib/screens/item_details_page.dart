import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_nav_bar.dart';

class ItemDetailsPage extends StatefulWidget {
  const ItemDetailsPage({super.key});

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  bool isFavorite = false;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: Container(
          width: 412,
          height: 917,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFADF1AA), Colors.white],
            ),
          ),
          child: Stack(
            children: [
              // Top bar
              Positioned(
                top: 20,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pushReplacementNamed('/grocery'),
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    Text(
                      'Red Apple',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: isFavorite ? const Color(0xFF1B4919) : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                        ),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.white : Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Image box
              Positioned(
                top: 80,
                left: (412 - 173) / 2,
                child: Container(
                  width: 173,
                  height: 212,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.35),
                        offset: const Offset(0, 4),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      width: 156,
                      height: 156,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(0, 4),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.image,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              // Big green details box
              Positioned(
                top: 320,
                left: 9,
                child: Container(
                  width: 394,
                  height: 357,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B4919).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 4),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Left content
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Red Apple',
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Fresh Fruits',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Rs.167',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFADF1AA),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '100g',
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Details',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 250,
                              child: Text(
                                'Apples are incredibly good for you, and eating them is linked to a lower risk of many major diseases, including diabetes and cancer. What\'s more, its soluble fiber content may promote weight loss and gut health. A medium apple equals 1.5 cups of fruit — which is 3/4 of the 2-cup daily recommendation for fruit. For the greatest benefits, eat the whole fruit — both skin and flesh. [Source: www.healthline.com] Disclaimer: Please note that the image is used for presentation purposes only. Actual product may slightly defer. Our team at Cargills Online takes every step to ensure to maintain the accuracy of all information displayed.',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Quantity selector
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Container(
                          width: 112,
                          height: 38,
                          decoration: BoxDecoration(
                            color: const Color(0xFFB2E0AB),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    if (quantity > 1) {
                                      setState(() {
                                        quantity--;
                                      });
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      '-',
                                      style: GoogleFonts.inter(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    quantity.toString(),
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                      color: const Color(0xFF337630),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      '+',
                                      style: GoogleFonts.inter(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // More Fruits text
              Positioned(
                top: 700,
                left: 20,
                child: Text(
                  'More Fruits',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF337630),
                  ),
                ),
              ),
              // Fruit strip
              Positioned(
                top: 730,
                left: 0,
                child: Container(
                  width: 412,
                  height: 85,
                  color: const Color(0xFF337630),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      6,
                      (index) => Container(
                        width: 61,
                        height: 65,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              offset: const Offset(0, 4),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.image,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Action buttons
              Positioned(
                bottom: 80,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pushReplacementNamed('/cart'),
                      child: Container(
                        width: 187,
                        height: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4CE546),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            'Add to Cart',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pushReplacementNamed('/checkout'),
                      child: Container(
                        width: 187,
                        height: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4CE546),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            'Buy Now',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
