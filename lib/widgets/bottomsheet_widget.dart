import 'package:flutter/material.dart';

Widget bottomSheet(context, VoidCallback takeCameraPhoto, VoidCallback getPhotoFile) {
  return Container(
    height: 100.0,
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    child: Column(
      children: <Widget>[
        const Text(
          "Elige una foto",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          FlatButton.icon(
            icon: const Icon(Icons.camera),
            onPressed: () {
              takeCameraPhoto();
            },
            label: const Text("Cámara"),
          ),
          FlatButton.icon(
            icon: const Icon(Icons.image),
            onPressed: () {
              getPhotoFile();
            },
            label: const Text("Galería"),
          ),
        ])
      ],
    ),
  );
}
