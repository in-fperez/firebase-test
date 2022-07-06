part of 'task_list_cubit.dart';

class TaskListState {
  Map<String, Task> tasksById = <String, Task>{};
  Map<String, dynamic>? ordering;
  late Map<String, dynamic>? filter;
  late Map<String, dynamic>? view;
  bool isLoading;

  TaskListState({
    Map<String, Task>? tasksById,
    this.isLoading = false,
    this.ordering,
    this.filter,
    this.view,
  }) {
    this.tasksById = tasksById ?? this.tasksById;
  }

  TaskListState copyWith({
    Map<String, Task>? tasksById,
    bool? isLoading,
    Map<String, dynamic>? ordering,
    Map<String, dynamic>? filter,
    Map<String, dynamic>? view,
  }) {
    return TaskListState(
      tasksById: tasksById ?? this.tasksById,
      isLoading: isLoading ?? this.isLoading,
      ordering: ordering ?? this.ordering ?? taskOrderingOptions[0],
      filter: filter ?? this.filter,
      view: view ?? this.view,
    );
  }
}
