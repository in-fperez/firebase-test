import 'package:bloc/bloc.dart';
import 'package:firebase_testv2/models/product/product.dart';
import 'package:firebase_testv2/services/product_service.dart';

part 'product_list_state.dart';

class ProductsListCubit extends Cubit<ProductListState> {
  ProductsListCubit() : super(ProductListState());

  Future<void> fetchProducts() async {
    var products = await ProductService.fetchProducts();
    emit(state.copyWith(products: products));
  }

  void orderById() {
    emit(state.copyWith(products: state.products.reversed.toList()));
  }
}
