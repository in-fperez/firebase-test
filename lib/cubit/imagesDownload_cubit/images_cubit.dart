import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  ImagesCubit() : super(ImageInitial());
  int downloadedImages = 0;
  int totalImages = 0;
  bool isDownloadFinished = false;
  bool isCalculatingImagesToDownload = true;
  double percentDownload = 0;

  set total(int total) => totalImages = total;

  void updateCount() {
    downloadedImages++;
    emit(ImageChange());
  }

  void updateDownloadProcess() {
    isDownloadFinished = true;
    emit(ImageChange());
  }

  void updateCalculatingImagesToDownload() {
    isCalculatingImagesToDownload = false;
    emit(ImageChange());
  }

  void updatePercentDownload() {
    if (downloadedImages == totalImages) {
      percentDownload = 1;
    }
    percentDownload = downloadedImages / totalImages;
    emit(ImageChange());
  }
}
