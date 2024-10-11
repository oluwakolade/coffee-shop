// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_cart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cartTotalHash() => r'8ae17356be3c94ee57f025203909f3f55d84a608';

/// See also [cartTotal].
@ProviderFor(cartTotal)
final cartTotalProvider = AutoDisposeProvider<double>.internal(
  cartTotal,
  name: r'cartTotalProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartTotalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CartTotalRef = AutoDisposeProviderRef<double>;
String _$cartStateHash() => r'a9287cae22a4eab85b2b6c1f1a961f95ce1e6b35';

/// See also [CartState].
@ProviderFor(CartState)
final cartStateProvider =
    AutoDisposeNotifierProvider<CartState, List<CoffeeProduct>>.internal(
  CartState.new,
  name: r'cartStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CartState = AutoDisposeNotifier<List<CoffeeProduct>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
