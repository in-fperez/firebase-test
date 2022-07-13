import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_testv2/bloc/product_list/product_list_cubit.dart';
import 'package:firebase_testv2/bloc/task_list/task_list_cubit.dart';
import 'package:firebase_testv2/screens/login_screen/login_screen.dart';
import 'package:firebase_testv2/screens/options_screen/settings_screen.dart';
import 'package:firebase_testv2/screens/product_details/product_details_screen.dart';
import 'package:firebase_testv2/screens/product_list_screen/product_list_screen.dart';
import 'package:firebase_testv2/screens/task_list_screen/task_list_screen.dart';
import 'package:firebase_testv2/bloc/context/context_cubit.dart';

class AppRouter {
  var contextCubit = ContextCubit();
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TaskListScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<TaskListCubit>(
            create: (context) => TaskListCubit(),
            child: const TaskListScreen(),
          ),
          settings: settings,
        );
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
          settings: settings,
        );
      case SettingsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(),
          settings: settings,
        );
      case ProductsListScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ProductListCubit>(
            create: (context) => ProductListCubit(),
            child: const ProductsListScreen(),
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Container(),
          settings: settings,
        );
    }
  }
}
