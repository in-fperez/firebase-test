part of 'product_list_cubit.dart';

class ProductListState {
  late List<Product> products;
  bool isLoading;

  ProductListState({
    this.products = const [],
    this.isLoading = false,
  });

  ProductListState copyWith(
      {List<Product>? products, bool? isLoading, String? orderDropdownValue}) {
    return ProductListState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
