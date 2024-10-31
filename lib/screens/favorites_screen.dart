import 'package:coffee_shop/components/coffee_card.dart';
import 'package:coffee_shop/constants/text_constant.dart';
import 'package:coffee_shop/models/coffee_model.dart';
import 'package:coffee_shop/provider/coffee_cart_provider.dart';
import 'package:coffee_shop/provider/coffee_fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoriteStateProvider);
    final cart = ref.watch(cartStateProvider);

    //add to favorites

    void onAddFav(CoffeeProduct coffeeProduct) {
      ref.read(favoriteStateProvider.notifier).addFavCoffee(coffeeProduct);
    }

    //remove from favorites
    void onRemoveFav(CoffeeProduct coffeeProduct) {
      ref.read(favoriteStateProvider.notifier).removeFavCoffee(coffeeProduct);
    }

    //add to cart
    //addtoCart
    void onAddToCart(CoffeeProduct coffeeProduct) {
      ref.read(cartStateProvider.notifier).addCoffee(coffeeProduct);
    }

    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const HeaderText(text: "Favorites"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.9,
              ),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                CoffeeProduct coffeeProduct = favorites[index];

                bool isInCart = cart.contains(coffeeProduct);
                bool isInFav = favorites.contains(coffeeProduct);

                return CoffeeCard(
                  coffeeName: coffeeProduct.name,
                  coffeeImage: coffeeProduct.imageUrl,
                  coffeePrice: coffeeProduct.price,
                  onAddToCart: () => onAddToCart(coffeeProduct),
                  onImageTap: () => null,
                  //text button
                  textButton: isInCart
                      ? TextButton.icon(
                          onPressed: null,
                          icon: const Icon(
                            Icons.check,
                            color: Color(0XFFC67C4e),
                            size: 14,
                          ),
                          label: const AppText(
                              text: "Added",
                              color: Color(0XFFC67C4E),
                              fontWeight: FontWeight.bold,
                              fontsize: 14))
                      : TextButton.icon(
                          onPressed: () => onAddToCart(coffeeProduct),
                          icon: const Icon(
                            Icons.add,
                            color: Color(0XFFC67C4e),
                            size: 14,
                          ),
                          label: const AppText(
                              text: "Add to cart",
                              color: Color(0XFFC67C4E),
                              fontWeight: FontWeight.bold,
                              fontsize: 14),
                        ),

                  //favorite icon

                  favIcon: isInFav
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
                );
              }),
        ));
  }
}
