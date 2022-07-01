import 'dart:ffi';

import 'package:flutter/material.dart';

Widget bottomSheet(
    context, VoidCallback takeCameraPhoto, VoidCallback getPhotoFile) {
  return Container(
    height: 100.0,
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    child: Column(
      children: <Widget>[
        Text(
          "Choose Profile photo",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.camera),
            onPressed: () {
              takeCameraPhoto();
            },
            label: Text("Camera"),
          ),
          FlatButton.icon(
            icon: Icon(Icons.image),
            onPressed: () {
              getPhotoFile();
            },
            label: Text("Gallery"),
          ),
        ])
      ],
    ),
  );
}
