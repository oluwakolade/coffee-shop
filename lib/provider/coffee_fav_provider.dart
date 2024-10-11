import 'package:coffee_shop/models/coffee_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coffee_fav_provider.g.dart';

@riverpod
class FavoriteState extends _$FavoriteState {
  //initial state
  @override
  List<CoffeeProduct> build() {
    return [];
  }

  //add to favorite
  void addFavCoffee(CoffeeProduct coffeeProduct) {
    if (!state.contains(coffeeProduct)) {
      state = [...state, coffeeProduct];
    }
  }

  //remove from favorite
  void removeFavCoffee(CoffeeProduct coffeeProduct) {
    if (state.contains(coffeeProduct)) {
      state = state.where((item) => item.id != coffeeProduct.id).toList();
    }
  }
}
