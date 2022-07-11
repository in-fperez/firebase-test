import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:firebase_testv2/screens/widgets/card/collapsed_card_widget.dart';
import 'package:firebase_testv2/screens/widgets/card/card_widget.dart';
import 'package:firebase_testv2/screens/widgets/list_view/list_view_widget.dart';
import 'package:firebase_testv2/models/product.dart';

class ProductListWidget extends StatelessWidget {
  final bool isCard;
  final List<Product> products;
  const ProductListWidget(
      {Key? key, required this.products, required this.isCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListViewWidget(
      items: this.products,
      cardBuilder: (Product product) {
        return GestureDetector(
          onTap: () {},
          child: isCard
              ? CardWidget(product: product)
              : CollapsedCardWidget(product: product),
        );
      },
    );
  }
}
