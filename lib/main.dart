import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/grocery_list_page.dart';
import 'screens/item_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lanka Smart Mart',
      theme: ThemeData(
        fontFamily: 'Inter',
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/grocery': (context) => const GroceryListPage(),
        '/item': (context) => const ItemDetailsPage(),
        '/cart': (context) => const _CartPage(),
        '/orders': (context) => const _MyOrdersPage(),
        '/profile': (context) => const _ProfilePage(),
        '/settings': (context) => const _SettingPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

// Minimal placeholder pages for bottom navigation targets
class _CartPage extends StatelessWidget {
  const _CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text('Cart', style: Theme.of(context).textTheme.titleLarge)),
      ),
    );
  }
}

class _MyOrdersPage extends StatelessWidget {
  const _MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text('My Orders', style: Theme.of(context).textTheme.titleLarge)),
      ),
    );
  }
}

class _ProfilePage extends StatelessWidget {
  const _ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text('Profile', style: Theme.of(context).textTheme.titleLarge)),
      ),
    );
  }
}

class _SettingPage extends StatelessWidget {
  const _SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text('Settings', style: Theme.of(context).textTheme.titleLarge)),
      ),
    );
  }
}
