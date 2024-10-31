import 'package:coffee_shop/components/coffee_card.dart';
import 'package:coffee_shop/components/search_bar.dart';
import 'package:coffee_shop/constants/text_constant.dart';
import 'package:coffee_shop/models/coffee_model.dart';
import 'package:coffee_shop/provider/coffee_cart_provider.dart';
import 'package:coffee_shop/provider/coffee_fav_provider.dart';
import 'package:coffee_shop/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final filteredProducts = ref.watch(filteredCoffeeProductsProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final cart = ref.watch(cartStateProvider);
    final favorites = ref.watch(favoriteStateProvider);

    //addtoCart
    void onAddToCart(CoffeeProduct coffeeProduct) {
      ref.read(cartStateProvider.notifier).addCoffee(coffeeProduct);
    }

    //add to favorites

    void onAddFav(CoffeeProduct coffeeProduct) {
      ref.read(favoriteStateProvider.notifier).addFavCoffee(coffeeProduct);
    }

    //remove from favorites
    void onRemoveFav(CoffeeProduct coffeeProduct) {
      ref.read(favoriteStateProvider.notifier).removeFavCoffee(coffeeProduct);
    }

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      // appBar: AppBar(
      //   toolbarHeight: 100,
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   title:
      // ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CoffeeSearchbar(
            onChanged: (value) =>
                ref.read(searchQueryProvider.notifier).updateQuery(value),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        filteredProducts.isEmpty
            ? const Center(child: BodyText(text: 'No products found'))
            : Expanded(
                child: GridView.builder(
                  itemCount: filteredProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    CoffeeProduct coffeeProduct = filteredProducts[index];
                    bool isInCart = cart.contains(coffeeProduct);
                    bool isInFav = favorites.contains(coffeeProduct);

                    return CoffeeCard(
                      coffeeName: coffeeProduct.name,
                      coffeeImage: coffeeProduct.imageUrl,
                      coffeePrice: coffeeProduct.price,
                      onAddToCart: () => onAddToCart(coffeeProduct),
                      onImageTap: () => null,
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
                                fontsize: 14,
                              ),
                            )
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
                                fontsize: 14,
                              ),
                            ),
                      favIcon: isInFav
                          ? IconButton(
                              onPressed: () => onRemoveFav(coffeeProduct),
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 16,
                              ),
                            )
                          : IconButton(
                              onPressed: () => onAddFav(coffeeProduct),
                              icon: const Icon(
                                Icons.favorite_outline,
                                color: Color(0XFFA2A2A2),
                                size: 16,
                              ),
                            ),
                    );
                  },
                ),
              ),
      ]),
    );
  }
}
