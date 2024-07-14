import 'package:flutter_task_event/domain/usecases/fetch_products.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../data/repositories/product_repository_impl.dart';
import '../../domain/repositories/product_repository.dart';
import '../../presentation/cubit/product_cubit.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);

@module
abstract class RegisterModule {
  @lazySingleton
  ProductRepository get productRepository => ProductRepositoryImpl();

  @lazySingleton
  FetchProducts get fetchProducts => FetchProducts(productRepository);

  @lazySingleton
  ProductCubit get productCubit => ProductCubit(fetchProducts);
}
