import 'package:flutter/material.dart';

class CoffeeSearchbar extends StatelessWidget {
  final ValueChanged onChanged;
  const CoffeeSearchbar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: "Search...",
            filled: true,
            fillColor: const Color(0xffEDEDED),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
