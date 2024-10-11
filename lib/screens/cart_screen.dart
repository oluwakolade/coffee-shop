import 'package:coffee_shop/components/cart_card.dart';
import 'package:coffee_shop/constants/button_constant.dart';
import 'package:coffee_shop/constants/text_constant.dart';
import 'package:coffee_shop/models/coffee_model.dart';
import 'package:coffee_shop/provider/coffee_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartStateProvider);
    final totalPrice = ref.watch(cartTotalProvider);

    void onDelete(CoffeeProduct coffeeProduct) {
      ref.read(cartStateProvider.notifier).removeCoffee(coffeeProduct);
    }

    void onClearCart(CoffeeProduct coffeeProduct) {
      ref.read(cartStateProvider.notifier).clearCart(coffeeProduct);
    }

    return Scaffold(
      appBar: AppBar(
        title: const HeaderText(text: "Your Cart"),
        actions: [
          TextButton.icon(
            onPressed: () => onClearCart,
            icon: const Icon(
              Icons.delete,
              color: Color(0XFFC67C4E),
              size: 14,
            ),
            label: const AppText(
                text: "Clear Cart",
                color: Color(0XFFC67C4E),
                fontWeight: FontWeight.bold,
                fontsize: 14),
          ),
        ],
      ),
      //body
      body: Column(
        children: [
          Flexible(
              child: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              CoffeeProduct coffeeProduct = cart[index];
              return CartCard(
                  cartImage: coffeeProduct.imageUrl,
                  coffeeName: coffeeProduct.name,
                  coffeePrice: coffeeProduct.price,
                  onDelete: () => onDelete(coffeeProduct));
            },
          )),
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
                      const ProductTitle(text: "Total"),
                      const SizedBox(
                        height: 5,
                      ),
                      ProductSubTitle(text: '\$ ${totalPrice.toString()}')
                    ],
                  ),
                ),
                Expanded(
                  child: AppButton(text: "Checkout", onTap: () {}),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
