import 'package:firebase_testv2/models/product.dart';
import 'package:firebase_testv2/screens/product_details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductListElement extends StatelessWidget {
  final Product product;

  const ProductListElement({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) =>
                      ProductDetailsScreen(product: product))));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  product.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    letterSpacing: 0.15,
                  ),
                ),
              ),
              Chip(label: Text(this.product.warehouse)),
              Text(
                DateFormat.yMd().format(this.product.dateUpd),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  letterSpacing: 0.15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
