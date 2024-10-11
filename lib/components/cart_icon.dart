import 'package:coffee_shop/provider/coffee_cart_provider.dart';
import 'package:coffee_shop/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartIcon extends ConsumerWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartStateProvider).length;

    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const CartScreen();
            }));
          },
          icon: const Icon(Icons.shopping_cart_outlined),
          color: Colors.black,
        ),
        Positioned(
          top: 5,
          left: 5,
          child: Container(
            width: 15,
            height: 15,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0XFFC67C4E),
            ),
            child: Text(
              cartItems.toString(),

              // numberOfItemsInCart.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ),
      ],
    );
  }
}




// class  extends ConsumerWidget {
//   const CartIcon({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final numberOfItemsInCart = ref.watch(cartNotifierProvider).length;

//     return 
//   }
// }
