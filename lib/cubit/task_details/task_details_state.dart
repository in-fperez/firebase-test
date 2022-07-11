part of 'task_details_cubit.dart';

class TaskDetailsState {
  late bool isExpansionPanelExpanded;

  TaskDetailsState({
    this.isExpansionPanelExpanded = false,
  });

  TaskDetailsState copyWith({
    bool? isExpansionPanelExpanded,
  }) {
    return TaskDetailsState(
      isExpansionPanelExpanded:
          isExpansionPanelExpanded ?? this.isExpansionPanelExpanded,
    );
  }
}
