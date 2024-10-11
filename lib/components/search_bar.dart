import 'package:flutter/material.dart';

class CoffeeSearchbar extends StatelessWidget {
  const CoffeeSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
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
          //icon button
          Container(
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: const Color(0xffc67c4e),
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: const Color(0XFFEDEDED),
              iconSize: 24,
            ),
          )
        ],
      ),
    );
  }
}
