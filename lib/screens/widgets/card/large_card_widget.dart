import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:firebase_testv2/constants/constants.dart';

class LargeCardWidget extends StatelessWidget {
  final String title;
  final String avatarTitle;
  final String chipText;
  final String imagePath;
  final String? tooltipText;
  final DateTime? date;
  const LargeCardWidget({
    Key? key,
    required this.title,
    required this.avatarTitle,
    required this.chipText,
    required this.imagePath,
    this.tooltipText,
    this.date,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        horizontalTitleGap: 15,
        // contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(
          backgroundColor: ColorConstants.accentColor,
          radius: 20,
          child: Text(
            'A',
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: Text(this.title),
        subtitle: Row(
          children: [
            this.date != null
                ? Text(
                    DateFormat.yMd().format(
                      this.date ?? DateTime.now(),
                    ),
                  )
                : SizedBox(
                    width: 0,
                    height: 0,
                  ),
            SizedBox(width: 5),
            Chip(
              label: Text(
                this.chipText,
              ),
              backgroundColor: ColorConstants.accentColor,
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            SizedBox(width: 5),
            this.tooltipText != null
                ? Tooltip(
                    message: this.tooltipText,
                    triggerMode: TooltipTriggerMode.tap,
                    child: Icon(
                      Icons.info_outline,
                      size: 20,
                      color: ColorConstants.accentColor,
                    ),
                  )
                : Container(),
          ],
        ),
        trailing: Image(
          image: AssetImage('images/task.png'),
        ),
      ),
    );
  }
}
