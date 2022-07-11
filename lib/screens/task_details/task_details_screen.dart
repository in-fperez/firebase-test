import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_testv2/screens/widgets/expansion_panel/expansion_panel_widget.dart';
import 'package:firebase_testv2/screens/widgets/details_header/details_header.dart';
import 'package:firebase_testv2/screens/widgets/app_layout/app_layout_widget.dart';
import 'package:firebase_testv2/screens/widgets/tab_bar/tab_bar_widget.dart';
import 'package:firebase_testv2/cubit/task_details/task_details_cubit.dart';
import 'package:firebase_testv2/models/task.dart';

class TaskDetailsScreen extends StatefulWidget {
  final Task task;
  static const routeName = '/task_details';
  const TaskDetailsScreen({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(length: 3, vsync: this);
    var taskDetailsCubit = BlocProvider.of<TaskDetailsCubit>(context);
    return AppLayoutWidget(
      title: "Ficha",
      showBottomNavigationBar: true,
      shouldBeLogged: true,
      body: Column(
        children: [
          DetailsHeaderWidget(task: widget.task),
          TabBarWidget(
            tabBarElements: ["Sin asingar", "En proceso", "Urgentes"],
            tabController: tabController,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 18),
                    child: ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        taskDetailsCubit.updateExpansionPanel(
                            !isExpanded, index);
                      },
                      children: [
                        expansionPanel().createExpansionPanel(
                            "Resumen Tarea",
                            Text("Ejemplo de title"),
                            Text("Ejemplo de body"),
                            taskDetailsCubit.state.isExpansionPanelExpanded),
                        expansionPanel().createExpansionPanel(
                            "Detalles de la tarea",
                            Text("Ejemplo de title"),
                            Text("Ejemplo de body"),
                            taskDetailsCubit.state.isExpansionPanelExpanded)
                      ],
                    ),
                  ),
                ),
                Container(child: Text('aaaa')),
                Container(child: Text('aaaa')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
