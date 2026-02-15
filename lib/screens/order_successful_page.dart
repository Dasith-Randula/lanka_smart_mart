import 'package:flutter/material.dart';
import 'dart:async';

class OrderSuccessfulPage extends StatefulWidget {
  const OrderSuccessfulPage({super.key});

  @override
  State<OrderSuccessfulPage> createState() => _OrderSuccessfulPageState();
}

class _OrderSuccessfulPageState extends State<OrderSuccessfulPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  bool _showPopup = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Show popup after 1000ms
    Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        _showPopup = true;
      });
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _dismissPopup() {
    _animationController.reverse().then((_) {
      setState(() {
        _showPopup = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Color(0xFFADF1AA)],
            ),
          ),
          child: Stack(
            children: [
              // Top title
              const Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              // Popup overlay
              if (_showPopup)
                AnimatedBuilder(
                  animation: _fadeAnimation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _fadeAnimation.value,
                      child: Container(
                        color: Colors.black.withOpacity(0.65),
                        child: GestureDetector(
                          onTap: _dismissPopup,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {}, // Prevent dismissing when tapping inside
                              child: Container(
                                width: 355,
                                height: 553,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SingleChildScrollView(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Check icon
                                      Container(
                                        width: 135,
                                        height: 135,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: const Color(0xFF08CB00),
                                            width: 4,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.check,
                                          size: 80,
                                          color: Color(0xFF08CB00),
                                        ),
                                      ),
                                      const SizedBox(height: 40),
                                      // Continue Shopping button
                                      GestureDetector(
                                        onTap: () => Navigator.of(context).pushReplacementNamed('/'),
                                        child: Container(
                                          width: 230,
                                          height: 67,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF4CE546),
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            'Continue Shopping',
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      // Under text
                                      const Text(
                                        'You can track delivery in the "Order\nTracking" section.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      // Order Tracking button
                                      GestureDetector(
                                        onTap: () => Navigator.of(context).pushNamed('/order_tracking'),
                                        child: Container(
                                          width: 230,
                                          height: 67,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF4CE546),
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            'Order Tracking',
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}