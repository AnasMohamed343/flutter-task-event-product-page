import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final String apiUrl = 'https://dummyjson.com/products';

  @override
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['products'] as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
