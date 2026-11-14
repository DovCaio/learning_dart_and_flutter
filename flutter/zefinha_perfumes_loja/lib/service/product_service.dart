import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class ProductService {
  //final String baseUrl = 'http://10.0.2.2:8080'; for mobile
  final String baseUrl = 'http://localhost:8000';

  Future<List<ProductMinimized>> getProducts() async {
    final response = await http.get(
      Uri.parse('$baseUrl/products/get_all')
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ProductMinimized.fromJson(json)).toList();
    }
    throw Exception("Erro ao buscar produtos");
  }

  Future<Product> getProduct(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/products/get_one?id=$id'),
    );
    if (response.statusCode == 200) {
      final dynamic data = jsonDecode(response.body);
      return Product.fromJson(data);
    }
    throw Exception("Erro ao buscar um produto");
  }
}
