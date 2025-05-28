import 'package:bloc/bloc.dart';
import '../data/repo/product_repository.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc(this.repository) : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      print('📦 LoadProducts triggered');
      emit(ProductLoading());
      try {
        print('🌐 Calling fetchProducts...');

        final products = await repository.fetchProducts();
        print('✅ Products loaded: ${products.length}');

        emit(ProductLoaded(products));
      } catch (e) {
        print('❌ Error fetching products: $e');
        emit(ProductError(e.toString()));
      }
    });
  }
}
