import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsState());

  void updateExpansionPanel(bool isExpanded, int index) {
    emit(this.state.copyWith(isExpansionPanelExpanded: isExpanded));
  }
}
