import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../data/repositories/product_repository_impl.dart';
import '../../domain/repositories/product_repository.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);

@module
abstract class RegisterModule {
  @lazySingleton
  ProductRepository get productRepository => ProductRepositoryImpl();
}
