import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_nav_bar.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartItems = [
    {
      'title': 'Red Apple',
      'price': 167,
      'quantity': 1,
      'image': Container(
        width: 125,
        height: 125,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              offset: const Offset(4, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: const Icon(
          Icons.image,
          size: 50,
          color: Colors.grey,
        ),
      ),
    },
    {
      'title': 'Rosemary Mint\nScalp & Hair\nStrengthening Oil',
      'price': 1200,
      'quantity': 1,
      'image': Container(
        width: 125,
        height: 125,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              offset: const Offset(4, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: const Icon(
          Icons.image,
          size: 50,
          color: Colors.grey,
        ),
      ),
    },
  ];

  bool discountApplied = false;

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void updateQuantity(int index, int newQuantity) {
    if (newQuantity > 0) {
      setState(() {
        cartItems[index]['quantity'] = newQuantity;
      });
    }
  }

  double get subtotal => cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));

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
              colors: [Colors.white, Color(0xFFADF1AA)],
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
                      onTap: () => Navigator.of(context).pushReplacementNamed('/item'),
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
                      'My Cart',
                      style: GoogleFonts.inter(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 35), // Placeholder for symmetry
                  ],
                ),
              ),
              // Cart items
              Positioned(
                top: 80,
                left: 20,
                right: 20,
                child: Column(
                  children: List.generate(
                    cartItems.length,
                    (index) => Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      width: 352,
                      height: 154,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFF08CB00)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          cartItems[index]['image'],
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  cartItems[index]['title'],
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF1B4919),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Rs. ${cartItems[index]['price']}',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => removeItem(index),
                                child: const Icon(
                                  Icons.delete,
                                  color: Color(0xFF08CB00),
                                  size: 24,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFB2E0AB),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.white),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () => updateQuantity(index, cartItems[index]['quantity'] - 1),
                                        child: const Center(
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          cartItems[index]['quantity'].toString(),
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF337630),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () => updateQuantity(index, cartItems[index]['quantity'] + 1),
                                        child: const Center(
                                          child: Text(
                                            '+',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
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
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Discount button
              Positioned(
                top: 450,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      discountApplied = !discountApplied;
                    });
                  },
                  child: Container(
                    width: 350,
                    height: 41,
                    decoration: BoxDecoration(
                      color: discountApplied ? const Color(0xFF08CB00) : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(0, 4),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Enter Discount\nCode',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: discountApplied ? Colors.white : const Color(0xFF08CB00).withOpacity(0.31),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Apply button
              Positioned(
                top: 450,
                right: 20,
                child: Container(
                  width: 161,
                  height: 41,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 4),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Apply',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF08CB00),
                      ),
                    ),
                  ),
                ),
              ),
              // Subtotal box
              Positioned(
                top: 520,
                left: 20,
                child: Container(
                  width: 350,
                  height: 55,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'RS: ${subtotal.toStringAsFixed(2)}',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Total box
              Positioned(
                top: 590,
                left: 20,
                child: Container(
                  width: 350,
                  height: 55,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'RS: ${subtotal.toStringAsFixed(2)}',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Checkout button
              Positioned(
                bottom: 80,
                left: 135,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacementNamed('/checkout'),
                  child: Container(
                    width: 142,
                    height: 51,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CE546),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        'Checkout',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}