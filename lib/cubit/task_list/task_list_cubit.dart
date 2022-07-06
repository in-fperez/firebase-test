import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/task.dart';
import '../../screens/task_list_screen/constants/task_options_constants.dart';
import '../../services/task_service.dart';
part 'task_list_state.dart';

class TaskListCubit extends Cubit<TaskListState> {
  TaskListCubit() : super(TaskListState());

  void updateOrdering(int orderingId) {
    if (this.state.ordering?['id'] == orderingId) return;
    emit(
      this.state.copyWith(
            ordering: taskOrderingOptions
                .firstWhere((option) => orderingId == option['id']),
          ),
    );
  }

  void updateView(int viewId) {
    if (this.state.view?['id'] == viewId) return;
    emit(
      this.state.copyWith(
            view:
                taskViewsOptions.firstWhere((option) => viewId == option['id']),
          ),
    );
  }

  void updateFilter(int filterId) {
    if (this.state.filter?['id'] == filterId) return;
    emit(
      this.state.copyWith(
            filter: taskFilteringOptions
                .firstWhere((option) => filterId == option['id']),
          ),
    );
  }

  void initListener() {
    TaskService.initTaskSnapshotsListener(
      (tasks, addedTasks, modifiedTasks, removedTaskIds) {
        var newTasksById = this.state.tasksById;
        var addedAndModifiedTasks = [...addedTasks, ...modifiedTasks];
        for (var task in addedAndModifiedTasks) {
          newTasksById[task.id] = task;
        }
        for (var taskId in removedTaskIds) {
          newTasksById.remove(taskId);
        }
        emit(this.state.copyWith(tasksById: newTasksById));
      },
    );
  }

  List<Task> getTasks() {
    var tasks = this.state.tasksById.values.toList();
    var filter = this.state.filter;
    var ordering = this.state.ordering;
    if (filter == null && ordering == null) return tasks;
    tasks.sort((a, b) => ordering?['order'](a, b) ?? 1);
    if (filter == null) return tasks;
    var filteredTasks = tasks.where((task) {
      return filter['filter'](task);
    }).toList();
    return filteredTasks;
  }
}
