import 'package:coffee_shop/models/coffee_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coffee_cart_provider.g.dart';

@riverpod
class CartState extends _$CartState {
//initial state
  @override
  List<CoffeeProduct> build() {
    return [];
  }

//add to cart
  void addCoffee(CoffeeProduct coffeeProduct) {
    if (!state.contains(coffeeProduct)) {
      state = [...state, coffeeProduct];
    }
  }

//remove from cart
  void removeCoffee(CoffeeProduct coffeeProduct) {
    if (state.contains(coffeeProduct)) {
      state = state.where((item) => item.id != coffeeProduct.id).toList();
    }
  }

  //clear cart

  void clearCart(CoffeeProduct coffeeProduct) {
    if (state.contains(coffeeProduct)) {
      state = [];
    }
  }
}

@riverpod
double cartTotal(ref) {
  final cartProducts = ref.watch(cartStateProvider);

  double total = 0;

  for (CoffeeProduct coffeeProduct in cartProducts) {
    total += coffeeProduct.price;
  }

  return total;
}
