import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/user.dart';
import '../../models/vertical.dart';
import '../../models/warehouse.dart';
import '../../router/navigate.dart';
import '../../screens/login_screen/login_screen.dart';
import '../../screens/task_list_screen/task_list_screen.dart';
import '../../services/auth_service.dart';

part 'context_state.dart';

class ContextCubit extends Cubit<ContextState> {
  ContextCubit() : super(ContextState());

  void logout(BuildContext context) async {
    AuthService.logOut().then((value) {
      emit(ContextState());
      navigate(context, LoginScreen.routeName);
    });
  }

  void updateCurrentVertical(Vertical? vertical) {
    emit(this.state.copyWith(currentVertical: vertical));
  }

  void updateCurrentWarehouse(Warehouse? warehouse) {
    emit(this.state.copyWith(currentWarehouse: warehouse));
  }

  void updateThemeMode(bool? mode) {
    emit(this.state.copyWith(darkMode: mode));
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    AuthService.login(email, password).then((user) {
      emit(this.state.copyWith(user: user));
      navigate(context, TaskListScreen.routeName);
    });
  }
}
