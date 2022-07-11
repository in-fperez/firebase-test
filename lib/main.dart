import 'package:firebase_testv2/screens/product_list_screen/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_testv2/cubit/product_list/product_list_cubit.dart';
import 'package:firebase_testv2/router/app_router.dart';
import 'package:firebase_testv2/firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductListCubit()),
      ],
      child: IcemanApp(),
    ),
  );
}

class IcemanApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();
  IcemanApp({Key? key}) : super(key: key);
      productListCubit.initListener();

  @override
  Widget build(BuildContext context) {

        var productListCubit = BlocProvider.of<ProductListCubit>(context);
    productListCubit.initListener();

    
    return MaterialApp(
      title: 'Iceman App',
      debugShowCheckedModeBanner: false,
      initialRoute: ProductsListScreen.routeName,
      onGenerateRoute: this.appRouter.onGenerateRoute,
    );
  }
}
