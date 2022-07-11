import 'package:firebase_testv2/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_testv2/screens/widgets/card/large_collapsed_card_widget.dart';

class CollapsedCardWidget extends StatelessWidget {
  final Product? product;
  const CollapsedCardWidget({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic usingObject = this.product;
    return ListElementWidget(
      title: (usingObject?.name).toString(),
      chipText: (usingObject?.warehouse).toString(),
      date: this.product?.dateUpd,
    );
  }
}
