import 'package:firebase_testv2/screens/task_list_screen/widgets/task_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/task_list/task_list_cubit.dart';
import '../widgets/app_layout/app_layout_widget.dart';
import '../widgets/dropdown/dropdown_widget.dart';
import 'constants/task_options_constants.dart';

class TaskListScreen extends StatefulWidget {
  static const routeName = '/task-list';
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    var taskListCubit = BlocProvider.of<TaskListCubit>(context);
    taskListCubit.initListener();
    return AppLayoutWidget(
      title: 'Listing',
      shouldBeLogged: true,
      showBottomNavigationBar: true,
      body: BlocBuilder<TaskListCubit, TaskListState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownWidget(
                      title: 'Filtro',
                      items: taskFilteringOptions,
                      selected: state.filter?['id'],
                      value: 'id',
                      onChanged: (id) {
                        if (id != null) {
                          taskListCubit.updateFilter(id);
                        }
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    DropdownWidget(
                      title: 'Ordenación',
                      value: 'id',
                      items: taskOrderingOptions,
                      selected: state.ordering?['id'],
                      onChanged: (id) {
                        if (id != null) {
                          taskListCubit.updateOrdering(id);
                        }
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    DropdownWidget(
                      title: 'Vistas',
                      value: 'id',
                      items: taskViewsOptions,
                      selected: state.view?['id'],
                      onChanged: (id) {
                        if (id != null) {
                          taskListCubit.updateView(id);
                        }
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: TaskListWidget(
                    tasks: taskListCubit.getTasks(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
