import 'package:firebase_testv2/screens/product_list_screen/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Warehouse',
      theme: ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: const ColorScheme.light().copyWith(primary: Colors.red),
      ),
      initialRoute: ProductsListScreen.routeName,
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
