import 'package:firebase_testv2/cubit/imagesDownload_cubit/images_cubit.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ImageDownloadProgressIndicator extends StatelessWidget {
  const ImageDownloadProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var downloadState = Provider.of<ImagesCubit>(context, listen: true);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            downloadState.isDownloadFinished
                ? const Text('')
                : CircularPercentIndicator(
                    radius: 25.0,
                    lineWidth: 5.0,
                    animation: true,
                    percent: downloadState.percentDownload,
                    animateFromLastPercent: true,
                    center: Text('${(downloadState.percentDownload * 100).floor()}%'),
                    progressColor: Colors.green,
                  ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${downloadState.downloadedImages}/${downloadState.totalImages} Images downloaded',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
