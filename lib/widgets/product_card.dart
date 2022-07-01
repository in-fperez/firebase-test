import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_testv2/services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
    this.image,
    this.productDescription,
    this.productName,
    this.productPrice,
  );

  final String productName;
  final String productDescription;
  final double productPrice;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text(productName),
            subtitle: Text(productDescription),
            leading: FutureBuilder(
              future: getApplicationDocumentsDirectory(),
              builder:
                  (BuildContext context, AsyncSnapshot<Directory> snapshot) {
                if (snapshot.hasData) {
                  final imagePath = snapshot.data;
                  print(File('${imagePath?.path}/$image'));
                  return Image.file(File('${imagePath?.path}/${image}'));
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
