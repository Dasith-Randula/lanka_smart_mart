import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class ItemDetailsPage extends StatelessWidget {
  const ItemDetailsPage({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  // Large image placeholder
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Image.asset('assets/images/item_red_apple.jpg', fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text('Red Apple', style: TextStyle(fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text('Fresh red apple - product details go here.', style: TextStyle(fontFamily: 'Inter', fontSize: 14)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
