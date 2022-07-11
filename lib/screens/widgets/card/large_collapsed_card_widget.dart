import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:firebase_testv2/constants/constants.dart';

class ListElementWidget extends StatelessWidget {
  final String title;
  final String chipText;
  final DateTime? date;
  const ListElementWidget({
    Key? key,
    required this.title,
    required this.chipText,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 100,
              child: Text(
                this.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  letterSpacing: 0.15,
                ),
              ),
            ),
            Chip(
                backgroundColor: ColorConstants.accentColor,
                label: Text(this.chipText)),
            Text(
              DateFormat.yMd().format(this.date ?? DateTime.now()),
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
