import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/fetch_products.dart';

abstract class ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;

  ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}

class ProductCubit extends Cubit<ProductState> {
  final FetchProducts loadProducts;

  ProductCubit(this.loadProducts) : super(ProductLoading());

  Future<void> fetchProducts() async {
    try {
      final products = await loadProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> searchProductsByTitle(String title) async {
    try {
      final products = await loadProducts();
      final filteredProducts = products
          .where((product) => product.title!
              .toLowerCase()
              .trim()
              .startsWith(title.toLowerCase().trim()))
          .toList();
      emit(ProductLoaded(filteredProducts));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
