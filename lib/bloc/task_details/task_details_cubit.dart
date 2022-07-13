import 'package:flutter_bloc/flutter_bloc.dart';

part 'task_details_state.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  TaskDetailsCubit() : super(TaskDetailsState());

  void updateExpansionPanel(bool isExpanded, int index) {
    emit(this.state.copyWith(isExpansionPanelExpanded: isExpanded));
  }
}
