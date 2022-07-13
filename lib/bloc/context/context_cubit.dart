import 'package:firebase_testv2/screens/product_list_screen/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_testv2/models/user.dart';
import 'package:firebase_testv2/models/vertical.dart';
import 'package:firebase_testv2/models/warehouse.dart';
import 'package:firebase_testv2/router/navigate.dart';
import 'package:firebase_testv2/screens/login_screen/login_screen.dart';
import 'package:firebase_testv2/screens/task_list_screen/task_list_screen.dart';
import 'package:firebase_testv2/services/auth_service.dart';

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

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    var user = await AuthService.login(email, password);
    emit(this.state.copyWith(user: user));
    navigate(context, ProductsListScreen.routeName);
  }
}
