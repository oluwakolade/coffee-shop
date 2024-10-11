import 'package:coffee_shop/constants/button_constant.dart';
import 'package:coffee_shop/constants/text_constant.dart';
import 'package:coffee_shop/models/coffee_model.dart';
import 'package:coffee_shop/provider/coffee_fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoffeeDetails extends ConsumerWidget {
  final CoffeeProduct coffeeProduct;

  const CoffeeDetails({super.key, required this.coffeeProduct});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteStateProvider);
    bool isInFav = favorites.contains(coffeeProduct);

    //add to favorites

    void onAddFav(CoffeeProduct coffeeProduct) {
      ref.read(favoriteStateProvider.notifier).addFavCoffee(coffeeProduct);
    }

    //remove from favorites
    void onRemoveFav(CoffeeProduct coffeeProduct) {
      ref.read(favoriteStateProvider.notifier).removeFavCoffee(coffeeProduct);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios))
        ],
      ),
      backgroundColor: const Color(0xfff9f9f9),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(coffeeProduct.imageUrl),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 15),
                      child: Row(
                        children: [
                          HeaderText(text: coffeeProduct.name),
                          const Spacer(),
                          isInFav
                              ? IconButton(
                                  onPressed: () => onRemoveFav(coffeeProduct),
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 16,
                                  ))
                              : IconButton(
                                  onPressed: () => onAddFav(coffeeProduct),
                                  icon: const Icon(
                                    Icons.favorite_outline,
                                    color: Color(0XFFA2A2A2),
                                    size: 16,
                                  ),
                                ),
                        ],
                      ),
                    ),
                    ProductSubTitle(
                      text: coffeeProduct.description,
                    ),
                    const SizedBox(height: 10),
                    const ProductTitle(text: "Flavour Profile"),
                    ProductSubTitle(
                        text: coffeeProduct.flavorProfile.join(', ')),
                    const SizedBox(height: 10),
                    const ProductTitle(text: "Grind Option "),
                    ProductSubTitle(text: coffeeProduct.grindOption.join(', ')),
                    const SizedBox(height: 10),
                    const ProductTitle(text: "Weight"),
                    ProductSubTitle(text: coffeeProduct.weight.toString()),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15), // Add padding around Row
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // To space out the items
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Column(
                    children: [
                      const ProductTitle(text: "Price"),
                      const SizedBox(
                        height: 5,
                      ),
                      ProductSubTitle(
                          text: '\$${coffeeProduct.price.toString()}')
                    ],
                  ),
                ),
                Expanded(
                  child: AppButton(text: "Buy Now", onTap: () {}),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
