import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_testv2/cubit/product_details/product_details_cubit.dart';
import 'package:firebase_testv2/cubit/task_details/task_details_cubit.dart';
import 'package:firebase_testv2/cubit/product_list/product_list_cubit.dart';
import 'package:firebase_testv2/screens/login_screen/login_screen.dart';
import 'package:firebase_testv2/cubit/task_list/task_list_cubit.dart';
import 'package:firebase_testv2/cubit/internet/internet_cubit.dart';
import 'package:firebase_testv2/cubit/context/context_cubit.dart';
import 'package:firebase_testv2/config/shared_preferences.dart';
import 'package:firebase_testv2/cubit/theme/theme_cubit.dart';
import 'package:firebase_testv2/router/app_router.dart';
import 'package:firebase_testv2/firebase_options.dart';
import 'package:firebase_testv2/theme/themes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPrefs.init();
  var connectivity;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ContextCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider(create: (context) => ProductListCubit()),
        BlocProvider(create: (context) => TaskListCubit()),
        BlocProvider(create: (context) => ProductDetailsCubit()),
        BlocProvider(create: (context) => TaskDetailsCubit()),
      ],
      child: IcemanApp(connectivity: Connectivity()),
    ),
  );
}

class IcemanApp extends StatelessWidget {
  final Connectivity connectivity;
  final AppRouter appRouter = AppRouter();
  IcemanApp({Key? key, required this.connectivity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return MaterialApp(
      title: 'Iceman App',
      debugShowCheckedModeBanner: false,
      theme: themeCubit.state.isDark ? Themes.getDark() : Themes.getLight(),
      initialRoute: LoginScreen.routeName,
      onGenerateRoute: this.appRouter.onGenerateRoute,
    );
  }
}
