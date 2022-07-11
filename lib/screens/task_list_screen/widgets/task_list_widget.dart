import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:firebase_testv2/screens/widgets/card/collapsed_card_widget.dart';
import 'package:firebase_testv2/screens/widgets/card/card_widget.dart';
import 'package:firebase_testv2/screens/widgets/list_view/list_view_widget.dart';
import 'package:firebase_testv2/screens/task_details/task_details_screen.dart';
import 'package:firebase_testv2/models/task.dart';

class TaskListWidget extends StatelessWidget {
  final bool isCard;
  final List<Task> tasks;
  const TaskListWidget({Key? key, required this.tasks, required this.isCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListViewWidget(
      items: this.tasks,
      cardBuilder: (Task task) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => TaskDetailsScreen(task: task)),
                ),
              );
            },
            child: isCard
                ? CardWidget(task: task)
                : CollapsedCardWidget(task: task));
      },
    );
  }
}
