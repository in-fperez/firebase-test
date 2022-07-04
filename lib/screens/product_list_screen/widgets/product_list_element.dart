import 'package:firebase_testv2/models/product.dart';
import 'package:firebase_testv2/screens/global_widgets/warhouse_pill.dart';
import 'package:firebase_testv2/screens/product_details/product_details.dart';
import 'package:flutter/material.dart';

class ProductListElement extends StatelessWidget {
  final Product product;
  final int index;

  const ProductListElement({required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                product.id.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  letterSpacing: 0.15,
                ),
              ),
            ),
            const CustomWarehousePill(
              warehouseName: 'VIL',
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
      ),
    );
  }
}
