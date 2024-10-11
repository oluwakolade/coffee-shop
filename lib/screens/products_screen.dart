import 'package:coffee_shop/components/cart_icon.dart';
import 'package:coffee_shop/components/coffee_card.dart';
import 'package:coffee_shop/constants/text_constant.dart';
import 'package:coffee_shop/models/coffee_model.dart';
import 'package:coffee_shop/provider/coffee_cart_provider.dart';
import 'package:coffee_shop/provider/coffee_fav_provider.dart';
import 'package:coffee_shop/screens/coffee_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coffee_shop/provider/coffee_product_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final allProducts = ref.watch(coffeeProductsProvider);
    final cart = ref.watch(cartStateProvider);
    final favorites = ref.watch(favoriteStateProvider);

//take to coffee details screen
    void onImageTap(CoffeeProduct coffeeProduct) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CoffeeDetails(coffeeProduct: coffeeProduct),
        ),
      );
    }

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

    //products list ui

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Logo(),
        actions: const [CartIcon()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Image.asset(
                "assets_coffee/images/Banner.png",
              ),
              const SizedBox(
                height: 12,
              ),
              const HeaderText(text: "Explore Products"),
              const SizedBox(
                height: 12,
              ),

              //product list
              allProducts.when(
                data: (coffeeProducts) {
                  return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: coffeeProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (context, index) {
                        CoffeeProduct coffeeProduct = coffeeProducts[index];
                        bool isInCart = cart.contains(coffeeProduct);
                        bool isInFav = favorites.contains(coffeeProduct);

                        return CoffeeCard(
                          coffeeName: coffeeProduct.name,
                          coffeeImage: coffeeProduct.imageUrl,
                          coffeePrice: coffeeProduct.price,
                          onAddToCart: () => onAddToCart(coffeeProduct),
                          onImageTap: () => onImageTap(coffeeProduct),
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
                      });
                },
                error: (error, stackTrace) => Text('Error: $error'),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
