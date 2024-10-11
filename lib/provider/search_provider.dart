import 'package:coffee_shop/models/coffee_model.dart';
import 'package:coffee_shop/services/coffee_api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_provider.g.dart';

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  // Update search query
  void updateQuery(String newQuery) {
    state = newQuery;
  }
}

// Future provider to fetch coffee products
@riverpod
Future<List<CoffeeProduct>> coffeeSearchProducts(
    CoffeeSearchProductsRef ref) async {
  return await fetchCoffeeProducts();
}

// Provider for filtered coffee products based on the search query
@riverpod
List<CoffeeProduct> filteredCoffeeProducts(FilteredCoffeeProductsRef ref) {
  final query = ref.watch(searchQueryProvider).toLowerCase();
  final asyncCoffeeProducts = ref.watch(coffeeSearchProductsProvider);

  return asyncCoffeeProducts.maybeWhen(
    data: (coffeeProducts) {
      if (query.isEmpty) {
        return coffeeProducts;
      }

      return coffeeProducts
          .where((coffeeProduct) =>
              coffeeProduct.name.toLowerCase().contains(query))
          .toList();
    },
    orElse: () => [], // Return an empty list during loading/error states
  );
}
