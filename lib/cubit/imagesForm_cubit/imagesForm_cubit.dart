import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'imagesForm_state.dart';

class ImagesFormCubit extends Cubit<ImagesFormState> {
  ImagesFormCubit() : super(ImageInitial());
}
