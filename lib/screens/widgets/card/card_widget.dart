import 'package:firebase_testv2/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_testv2/screens/widgets/card/large_card_widget.dart';

class CardWidget extends StatelessWidget {
  final Product? product;
  const CardWidget({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic usingObject = this.product;
    return LargeCardWidget(
      title: (usingObject?.name).toString(),
      avatarTitle: 'A',
      chipText: (usingObject?.warehouse).toString(),
      imagePath: 'images/task.png',
      date: this.product?.dateUpd,
      tooltipText: '',
    );
  }
}
