import 'package:coffee_shop/constants/text_constant.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            HeaderText(text: "Work in progress"),
            Icon(
              Icons.construction,
              size: 50,
              color: Color(0XFFC67C4E),
            )
          ],
        ),
      ),
    );
  }
}
