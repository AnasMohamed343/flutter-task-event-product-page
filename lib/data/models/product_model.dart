import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    final int? id,
    final String? title,
    final String? description,
    final double? price,
    final double? discountPercentage,
    final double? rating,
    final int? stock,
    final String? brand,
    final String? category,
    final String? thumbnail,
    final List<String>? images,
  }) : super(
          id: id,
          title: title,
          description: description,
          price: price,
          discountPercentage: discountPercentage,
          rating: rating,
          stock: stock,
          brand: brand,
          category: category,
          thumbnail: thumbnail,
          images: images,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      rating: json['rating'],
      stock: json['stock'],
      brand: json['brand'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(json['images']),
    );
  }
}
