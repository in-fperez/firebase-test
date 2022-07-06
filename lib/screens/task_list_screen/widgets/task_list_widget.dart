import 'package:firebase_testv2/screens/product_list_screen/widgets/product_card_widget.dart';
import 'package:firebase_testv2/screens/task_list_screen/widgets/task_card_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/task.dart';

class TaskListWidget extends StatelessWidget {
  final List<Task> tasks;
  const TaskListWidget({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.tasks.length,
      itemBuilder: (context, index) => Column(
        children: [
          TaskCardWidget(task: this.tasks[index]),
        ],
      ),
    );
  }
}
