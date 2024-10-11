// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$coffeeSearchProductsHash() =>
    r'338e419bcf54621d507e6404225a83aa00f7ab2f';

/// See also [coffeeSearchProducts].
@ProviderFor(coffeeSearchProducts)
final coffeeSearchProductsProvider =
    AutoDisposeFutureProvider<List<CoffeeProduct>>.internal(
  coffeeSearchProducts,
  name: r'coffeeSearchProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$coffeeSearchProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CoffeeSearchProductsRef
    = AutoDisposeFutureProviderRef<List<CoffeeProduct>>;
String _$filteredCoffeeProductsHash() =>
    r'b76aec06905f6f59d84061cc211eae975b1e042d';

/// See also [filteredCoffeeProducts].
@ProviderFor(filteredCoffeeProducts)
final filteredCoffeeProductsProvider =
    AutoDisposeProvider<List<CoffeeProduct>>.internal(
  filteredCoffeeProducts,
  name: r'filteredCoffeeProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredCoffeeProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilteredCoffeeProductsRef = AutoDisposeProviderRef<List<CoffeeProduct>>;
String _$searchQueryHash() => r'e648613e33797a57d9e4b8f7bb16e5c55ebd750e';

/// See also [SearchQuery].
@ProviderFor(SearchQuery)
final searchQueryProvider =
    AutoDisposeNotifierProvider<SearchQuery, String>.internal(
  SearchQuery.new,
  name: r'searchQueryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchQuery = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
