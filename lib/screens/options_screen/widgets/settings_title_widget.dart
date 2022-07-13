import 'package:flutter/cupertino.dart';

import 'package:firebase_testv2/constants/constants.dart';
import 'package:flutter/material.dart';

class SettingsTitleWidget extends StatelessWidget {
  final String title;
  const SettingsTitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(35, 26, 0, 20),
      child: Text(
        this.title,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: 0.25,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    );
  }
}
