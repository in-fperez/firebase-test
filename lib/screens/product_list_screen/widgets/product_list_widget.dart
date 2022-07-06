import 'package:firebase_testv2/screens/product_list_screen/widgets/product_card_widget.dart';
import 'package:firebase_testv2/screens/product_list_screen/widgets/product_list_element.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/product.dart';

class ProductListWidget extends StatelessWidget {
  final bool isCard;
  final List<Product> products;
  const ProductListWidget(
      {Key? key, required this.products, required this.isCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (isCard) {
          return ProductCardWidget(
            product: this.products[index],
          );
        } else {
          return ProductListElement(product: this.products[index]);
        }
      },
      itemCount: this.products.length,
    );
  }
}
