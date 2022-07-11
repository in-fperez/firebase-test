part of 'product_details_cubit.dart';

class ProductDetailsState {
  late bool isExpansionPanelExpanded;

  ProductDetailsState({
    this.isExpansionPanelExpanded = false,
  });

  ProductDetailsState copyWith({
    bool? isExpansionPanelExpanded,
  }) {
    return ProductDetailsState(
      isExpansionPanelExpanded:
          isExpansionPanelExpanded ?? this.isExpansionPanelExpanded,
    );
  }
}
