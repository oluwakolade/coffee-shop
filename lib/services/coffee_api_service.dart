import 'package:coffee_shop/models/coffee_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<CoffeeProduct>> fetchCoffeeProducts() async {
  final response =
      await http.get(Uri.parse('https://fake-coffee-api.vercel.app/api'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((item) => CoffeeProduct.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load coffee products');
  }
}
