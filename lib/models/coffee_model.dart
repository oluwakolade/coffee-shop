class CoffeeProduct {
  final int id;
  final String name;
  final String imageUrl;
  final String description;
  final double price;
  final int weight;
  final List<String> flavorProfile;
  final List<String> grindOption;

  const CoffeeProduct(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.weight,
      required this.flavorProfile,
      required this.grindOption});

  factory CoffeeProduct.fromJson(Map<String, dynamic> json) {
    return CoffeeProduct(
        id: json['id'],
        name: json['name'],
        imageUrl: json['image_url'],
        description: json['description'],
        price: (json['price'] as num).toDouble(),
        weight: json['weight'],
        flavorProfile: List<String>.from(json['flavor_profile']),
        grindOption: List<String>.from(json['grind_option']));
  }
}

// https://iili.io/H8Y78Qt.webp