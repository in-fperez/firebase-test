import 'package:firebase_testv2/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_testv2/screens/widgets/card/large_card_widget.dart';
import 'package:firebase_testv2/models/task.dart';

class CardWidget extends StatelessWidget {
  final Task? task;
  final Product? product;
  const CardWidget({Key? key, this.task, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic usingObject = this.task != null ? this.task : this.product;
    return LargeCardWidget(
      title: (usingObject?.name).toString(),
      avatarTitle: 'A',
      chipText: (usingObject?.warehouse).toString(),
      imagePath: 'images/task.png',
      date: this.task != null ? this.task?.dateAdd : this.product?.dateUpd,
      tooltipText: this.task != null ? this.task?.warning : '',
    );
  }
}
