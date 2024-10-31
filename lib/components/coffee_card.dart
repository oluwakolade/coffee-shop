import 'package:coffee_shop/constants/text_constant.dart';
import 'package:flutter/material.dart';

class CoffeeCard extends StatelessWidget {
  final String coffeeName;
  final String coffeeImage;
  final double coffeePrice;
  final Function()? onImageTap;
  final Function()? onAddToCart;
  final Widget favIcon;

  final Widget textButton;

  const CoffeeCard(
      {super.key,
      required this.coffeeName,
      required this.coffeeImage,
      required this.coffeePrice,
      required this.onAddToCart,
      required this.onImageTap,
      required this.textButton,
      required this.favIcon});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                spreadRadius: 0,
                blurRadius: 20, // Increased blur radius
                offset: const Offset(0, 4),
              )
            ],
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image

            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GestureDetector(
                    onTap: onImageTap,
                    child: Image.network(
                      coffeeImage,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                    )),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: favIcon,
              )
            ]),
            ProductTitle(text: coffeeName),

            ProductSubTitle(text: '\$${coffeePrice.toString()}'),
            const Expanded(child: SizedBox()),
            Center(child: textButton),
          ],
        ),
      ),
    );
  }
}


// coffeeProductsProvider