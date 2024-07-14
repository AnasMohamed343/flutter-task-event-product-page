import 'package:flutter_task_event/data/repositories/product_repository_impl.dart';
import 'package:flutter_task_event/domain/usecases/fetch_products.dart';
import 'package:flutter_task_event/presentation/cubit/product_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductCubit', () {
    test('initial state is ProductLoading', () {
      final cubit = ProductCubit(FetchProducts(ProductRepositoryImpl()));
      expect(cubit.state, ProductLoading());
    });

    test('fetchProducts returns ProductLoaded state', () async {
      final cubit = ProductCubit(FetchProducts(ProductRepositoryImpl()));
      await cubit.fetchProducts();
      expect(cubit.state, isA<ProductLoaded>());
    });

    test('fetchProducts returns ProductError state on error', () async {
      final cubit = ProductCubit(FetchProducts(ProductRepositoryImpl()));
      await cubit.fetchProducts();
      expect(cubit.state, isA<ProductError>());
    });
  });
}
