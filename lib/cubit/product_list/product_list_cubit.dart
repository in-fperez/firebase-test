import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_testv2/models/product.dart';
import 'package:firebase_testv2/screens/product_list_screen/constants/product_options_constants.dart';
import 'package:firebase_testv2/services/product_service.dart';

part 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  ProductListCubit() : super(ProductListState());

  get filterId => state.filter?["id"];

  void updateOrdering(int orderingId) {
    if (this.state.ordering?['id'] == orderingId) return;
    emit(
      this.state.copyWith(
            ordering: productOrderingOptions
                .firstWhere((option) => orderingId == option['id']),
          ),
    );
  }

  void updateView(int viewId) {
    if (this.state.view?['id'] == viewId) return;
    emit(
      this.state.copyWith(
            view: productViewsOptions
                .firstWhere((option) => viewId == option['id']),
          ),
    );
  }

  void updateFilter(int filterId) {
    if (this.state.filter?['id'] == filterId) return;
    emit(
      this.state.copyWith(
            filter: productFilteringOptions
                .firstWhere((option) => filterId == option['id']),
          ),
    );
  }

  Future<void> initListener() async {
    ProductService.initProductSnapshotsListener(
      (products, addedProducts, modifiedProducts, removedProductIds) {
        var newProductsById = this.state.productsById;
        var addedAndModifiedProducts = [...addedProducts, ...modifiedProducts];
        for (var product in addedAndModifiedProducts) {
          newProductsById[product.id] = product;
        }
        for (var productId in removedProductIds) {
          newProductsById.remove(productId);
        }
        print(newProductsById);
        emit(this.state.copyWith(productsById: newProductsById));
      },
    );
  }

  List<Product> getProducts() {
    var products = this.state.productsById.values.toList();
    var filter = this.state.filter;
    var ordering = this.state.ordering;
    if (filter == null && ordering == null) return products;
    products.sort((a, b) => ordering?['order'](a, b) ?? 1);
    if (filter == null) return products;
    var filteredProducts = products.where((product) {
      return filter['filter'](product);
    }).toList();
    return filteredProducts;
  }
}
