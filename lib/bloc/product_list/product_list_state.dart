part of 'product_list_cubit.dart';

class ProductListState {
  Map<String, Product> productsById = <String, Product>{};
  Map<String, dynamic>? ordering;
  late Map<String, dynamic>? filter;
  late Map<String, dynamic>? view;
  bool isLoading;

  ProductListState({
    Map<String, Product>? productsById,
    this.isLoading = false,
    this.ordering,
    this.filter,
    this.view,
  }) {
    this.productsById = productsById ?? this.productsById;
  }

  ProductListState copyWith({
    Map<String, Product>? productsById,
    bool? isLoading,
    Map<String, dynamic>? ordering,
    Map<String, dynamic>? filter,
    Map<String, dynamic>? view,
  }) {
    return ProductListState(
      productsById: productsById ?? this.productsById,
      isLoading: isLoading ?? this.isLoading,
      ordering: ordering ?? this.ordering ?? productOrderingOptions[0],
      filter: filter ?? this.filter,
      view: view ?? this.view,
    );
  }
}
