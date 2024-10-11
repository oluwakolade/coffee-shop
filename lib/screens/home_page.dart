import 'package:coffee_shop/components/nav_bar.dart';
import 'package:coffee_shop/screens/favorites_screen.dart';
import 'package:coffee_shop/screens/products_screen.dart';
import 'package:coffee_shop/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    //homescreen
    const HomeScreen(),

    //favoritescreen
    const FavoritesScreen(),

    //settingsscreen
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff9f9f9),
        //bottom navigation bar
        bottomNavigationBar: CoffeeNavBar(
          onTabChange: (index) => navigateBottomBar(index),
        ),

//body
        body: _pages[_selectedIndex]);
  }
}
