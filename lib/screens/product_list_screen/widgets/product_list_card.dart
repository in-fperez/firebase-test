import 'package:flutter/material.dart';

import '../../../models/product/product.dart';
import '../../global_widgets/warhouse_pill.dart';

class ProductListCard extends StatelessWidget {
  final Product product;

  const ProductListCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 7),
        child: Image.asset("images/lixchair.jpg", width: 55),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 4, 5),
            child: Text(
              product.id.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 0.15,
              ),
            ),
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 11, 0),
                child: Text(
                  "26-01-2002",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.25,
                  ),
                ),
              ),
              CustomWarehousePill(
                warehouseName: 'VIL',
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
