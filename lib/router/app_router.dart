import 'package:firebase_testv2/cubit/product_list/product_list_cubit.dart';
import 'package:firebase_testv2/screens/login_screen/login_screen.dart';
import 'package:firebase_testv2/screens/options_screen/options_screen.dart';
import 'package:firebase_testv2/screens/product_details/product_details.dart';
import 'package:firebase_testv2/screens/product_list_screen/product_list_draggable_card.dart';
import 'package:firebase_testv2/screens/product_list_screen/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ProductsListDraggableScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ProductsListCubit>(
            create: (context) => ProductsListCubit(),
            child: const ProductsListDraggableScreen(),
          ),
          settings: settings,
        );
      case OptionsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const OptionsScreen(),
          settings: settings,
        );
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
          builder: (_) => const LoginScreen(),
          settings: settings,
        );
    }
  }
}
