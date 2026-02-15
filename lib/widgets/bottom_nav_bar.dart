import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    const Color activeColor = Color(0xFF4CE546);
    return Container(
      width: double.infinity,
      height: 53,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _NavItem(label: 'Home', icon: Icons.home, route: '/'),
          _NavItem(label: 'Cart', icon: Icons.shopping_cart, route: '/cart'),
          _NavItem(label: 'My Orders', icon: Icons.receipt_long, route: '/orders'),
          _NavItem(label: 'Profile', icon: Icons.person, route: '/profile'),
          _NavItem(label: 'Setting', icon: Icons.settings, route: '/settings'),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final String route;

  const _NavItem({required this.label, required this.icon, required this.route});

  @override
  Widget build(BuildContext context) {
    const Color activeColor = Color(0xFF4CE546);
    return Expanded(
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushReplacementNamed(route),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 24, color: activeColor),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(fontSize: 10, color: activeColor)),
          ],
        ),
      ),
    );
  }
}
