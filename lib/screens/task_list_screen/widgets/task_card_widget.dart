import 'package:firebase_testv2/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/task.dart';

class TaskCardWidget extends StatelessWidget {
  final Task task;
  const TaskCardWidget({Key? key, required this.task}) : super(key: key);

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
        title: Text(this.task.name),
        subtitle: Row(
          children: [
            Text(DateFormat.yMd().format(this.task.dateAdd)),
            SizedBox(width: 5),
            Chip(
              label: Text(
                this.task.warehouse,
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
            this.task.warning != null
                ? Tooltip(
                    message: this.task.warning,
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
