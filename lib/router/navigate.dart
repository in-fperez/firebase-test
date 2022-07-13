import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_testv2/screens/product_details/product_details_screen.dart';
import 'package:firebase_testv2/screens/product_list_screen/product_list_screen.dart';
import 'package:firebase_testv2/bloc/context/context_cubit.dart';
import 'package:firebase_testv2/screens/task_list_screen/task_list_screen.dart';

const Map<String, bool> protectedRoutes = {
  TaskListScreen.routeName: true,
  ProductsListScreen.routeName: true,
  ProductDetailsScreen.routeName: true
};

void navigate(BuildContext context, String routeName, {Object? arguments}) {
  var contextCubit = BlocProvider.of<ContextCubit>(context);
  var user = contextCubit.state.user;
  var allowedRoutes = user?.allowedRoutes ?? {};
  if (!(protectedRoutes[routeName] ?? false)) {
    Navigator.pushNamed(context, routeName);
    return;
  }
  if ((allowedRoutes[routeName] ?? false)) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
    return;
  }
  print('user does not have access to route $routeName');
}
