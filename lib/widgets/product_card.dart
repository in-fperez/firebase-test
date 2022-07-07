import 'package:firebase_testv2/services/loadImageCard.dart';
import 'package:flutter/material.dart';

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
              future: loadImageCard(image),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data is String) {
                    return Image.asset(snapshot.data);
                  } else {
                    return Image.file(snapshot.data);
                  }
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
