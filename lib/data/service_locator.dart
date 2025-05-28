import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sneaks_view/data/repo/product_repository.dart';

import '../bloc/product_bloc.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  // رجیستر کردن http.Client
  sl.registerLazySingleton<http.Client>(() => http.Client());

  // رجیستر کردن ProductRepository با وابستگی به http.Client
  sl.registerLazySingleton<ProductRepository>(() => ProductRepository(sl()));

  // رجیستر کردن BLoC با وابستگی به ProductRepository
  sl.registerFactory<ProductBloc>(() => ProductBloc(sl()));
}
