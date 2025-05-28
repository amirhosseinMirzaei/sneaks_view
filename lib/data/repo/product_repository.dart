import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/Sneaker.dart';

class ProductRepository {
  final http.Client client;

  ProductRepository(this.client);

  Future<List<Product>> fetchProducts() async {
    final response = await client.get(Uri.parse('http://localhost:3000/products'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
