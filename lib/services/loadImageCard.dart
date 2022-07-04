import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Future<dynamic> loadImageCard(String imageName) async {
  final imagePath = await getApplicationDocumentsDirectory();
  final imageFile = await File('${imagePath.path}/${imageName}').exists()
      ? File('${imagePath.path}/${imageName}')
      : 'images/placeholder.jpg';
  return imageFile;
}
