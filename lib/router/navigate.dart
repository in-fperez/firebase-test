import 'package:firebase_testv2/screens/product_list_screen/product_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/context/context_cubit.dart';
import '../screens/task_list_screen/task_list_screen.dart';

const Map<String, bool> protectedRoutes = {
  TaskListScreen.routeName: true,
  ProductsListScreen.routeName: true
};

void navigate(BuildContext context, String routeName) {
  var contextCubit = BlocProvider.of<ContextCubit>(context);
  var user = contextCubit.state.user;
  var allowedRoutes = user?.allowedRoutes ?? {};
  if (!(protectedRoutes[routeName] ?? false)) {
    Navigator.pushNamed(context, routeName);
    return;
  }
  if ((allowedRoutes[routeName] ?? false)) {
    Navigator.pushNamed(context, routeName);
    return;
  }
  print('user does not have access to route $routeName');
}
