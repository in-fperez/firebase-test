import 'package:firebase_testv2/cubit/product_list/product_list_cubit.dart';
import 'package:firebase_testv2/screens/product_list_screen/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ProductsListScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ProductsListCubit>(
            create: (context) => ProductsListCubit(),
            child: const ProductsListScreen(),
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ProductsListCubit>(
            create: (context) => ProductsListCubit(),
            child: const ProductsListScreen(),
          ),
          settings: settings,
        );
    }
  }
}
