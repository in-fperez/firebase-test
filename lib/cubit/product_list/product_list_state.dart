part of 'product_list_cubit.dart';

class ProductListState {
  late List<Product> products;
  bool isLoading;
  String filter;

  ProductListState(
      {this.products = const [], this.isLoading = false, this.filter = ''});

  ProductListState copyWith(
      {List<Product>? products, bool? isLoading, String? orderDropdownValue}) {
    return ProductListState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      filter: filter ?? this.filter,
    );
  }
}
