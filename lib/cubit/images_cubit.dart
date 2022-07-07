import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  ImagesCubit() : super(ImageInitial());
  int downloadedImages = 0;
  int totalImages = 0;
  bool isDownloadFinished = false;

  set total(int total) => totalImages = total;

  void updateCount() {
    downloadedImages++;
    emit(ImageChange());
  }

  void updateDownloadProcess() {
    isDownloadFinished = true;
    emit(ImageChange());
  }
}
