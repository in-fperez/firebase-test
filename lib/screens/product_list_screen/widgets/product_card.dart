import 'package:firebase_testv2/constants/constants.dart';
import 'package:firebase_testv2/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              product.id.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                letterSpacing: 0.15,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: const Color(0xff3e9a41),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            child: const Text(
              "VIL",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                letterSpacing: 0.25,
              ),
            ),
          ),
          const Text(
            "26-01-2002",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              letterSpacing: 0.15,
            ),
          ),
        ],
      ),
    );
  }
}
