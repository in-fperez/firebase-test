import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_testv2/constants/constants.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: Theme.of(context).colorScheme.onPrimary,
    );
  }
}
