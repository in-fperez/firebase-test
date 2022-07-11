import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_testv2/models/reference.dart';
import 'package:firebase_testv2/models/palet.dart';

part 'product_edit_state.dart';

class ProductEditCubit extends Cubit<ProductEditState> {
  ProductEditCubit() : super(ProductEditState());

  void updateCurrentPalet(Palet? palet) {
    emit(this.state.copyWith(currentPalet: palet));
  }

  void updateCurrentReference(Reference? reference) {
    emit(this.state.copyWith(currentReference: reference));
  }
}
