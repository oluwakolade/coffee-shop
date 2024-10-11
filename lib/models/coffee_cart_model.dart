import 'package:coffee_shop/models/coffee_model.dart';

class CoffeeCartItem {
  final CoffeeProduct coffeeProduct;
  int quantity;

  CoffeeCartItem({required this.coffeeProduct, this.quantity = 0});
}
