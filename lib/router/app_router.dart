import 'package:firebase_testv2/cubit/product_list/product_list_cubit.dart';
import 'package:firebase_testv2/cubit/task_list/task_list_cubit.dart';
import 'package:firebase_testv2/screens/login_screen/login_screen.dart';
import 'package:firebase_testv2/screens/options_screen/settings_screen.dart';
import 'package:firebase_testv2/screens/product_details/product_details.dart';
import 'package:firebase_testv2/screens/product_list_screen/product_list_draggable_card.dart';
import 'package:firebase_testv2/screens/product_list_screen/product_list_screen.dart';
import 'package:firebase_testv2/screens/task_list_screen/task_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/context/context_cubit.dart';

class AppRouter {
  var contextCubit = ContextCubit();
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TaskListScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<TaskListCubit>(
                create: (context) => TaskListCubit(),
              ),
              BlocProvider<ContextCubit>(
                create: (context) => contextCubit,
              ),
            ],
            child: const TaskListScreen(),
          ),
          settings: settings,
        );
      case ProductsListDraggableScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<ProductListCubit>(
                create: (context) => ProductListCubit(),
              ),
              BlocProvider<ContextCubit>(
                create: (context) => contextCubit,
              ),
            ],
            child: const ProductsListDraggableScreen(),
          ),
          settings: settings,
        );
      case LoginScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<ContextCubit>(
                  create: (context) => contextCubit,
                  child: LoginScreen(),
                ),
            settings: settings);
      case SettingsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ContextCubit>(
            create: (context) => contextCubit,
            child: SettingsScreen(),
          ),
          settings: settings,
        );
      case ProductsListScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<ProductListCubit>(
                create: (context) => ProductListCubit(),
              ),
              BlocProvider<ContextCubit>(
                create: (context) => contextCubit,
              ),
            ],
            child: const ProductsListScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Container(),
          settings: settings,
        );
    }
  }
}
