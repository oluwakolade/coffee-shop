import 'package:coffee_shop/models/coffee_model.dart';
import 'package:coffee_shop/services/coffee_api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coffee_product_provider.g.dart';

@riverpod
Future<List<CoffeeProduct>> coffeeProducts(ref) async {
  return await fetchCoffeeProducts();
}
