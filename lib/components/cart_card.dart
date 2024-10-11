import 'package:coffee_shop/constants/text_constant.dart';
import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  final String coffeeName;
  final String cartImage;
  final double coffeePrice;
  final Function()? onDelete;

  const CartCard({
    super.key,
    required this.cartImage,
    required this.coffeeName,
    required this.coffeePrice,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xfff9f9f9)),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              cartImage,
              height: 70,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductTitle(text: coffeeName),
              const SizedBox(
                height: 10,
              ),
              ProductSubTitle(text: '\$ ${coffeePrice.toString()}')
            ],
          ),
          const Spacer(),
          // const Expanded(child: SizedBox()),
          IconButton(
              onPressed: onDelete,
              icon: const Icon(
                Icons.delete,
                color: Color(0xffc67c4e),
              ))
        ],
      ),
    );
  }
}
