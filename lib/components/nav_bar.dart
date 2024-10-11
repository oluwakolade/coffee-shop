import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CoffeeNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const CoffeeNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
        onTabChange: (value) => onTabChange!(value),
        color: const Color(0xffa2a2a2),
        activeColor: const Color(0xffc67c4e),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tabs: const [
          GButton(icon: Icons.home),
          GButton(icon: Icons.favorite),
          GButton(icon: Icons.man),
        ]);
  }
}


// Color(0xffa2a2a2),
// const  Color(0xffc67c4e),