import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_testv2/cubit/internet/internet_cubit.dart';
import 'package:firebase_testv2/screens/login_screen/login_screen.dart';
import 'package:firebase_testv2/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'router/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(IcemanApp(connectivity: Connectivity()));
}

class IcemanApp extends StatelessWidget {
  final Connectivity connectivity;
  const IcemanApp({Key? key, required this.connectivity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return BlocProvider(
      create: (context) => InternetCubit(connectivity: connectivity),
      child: MaterialApp(
        title: 'Iceman App',
        theme: Themes.getLight(),
        darkTheme: Themes.getDark(),
        themeMode: ThemeMode.dark,
        initialRoute: LoginScreen.routeName,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
