import 'package:firebase_testv2/cubit/theme_cubit/theme_cubit.dart';
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
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (coontext) => ThemeCubit())],
      child: const IcemanApp(),
    ),
  );
}

class IcemanApp extends StatelessWidget {
  const IcemanApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: true);
    AppRouter appRouter = AppRouter();
    return MaterialApp(
      title: 'Iceman App',
      theme: theme.isDark ? Themes.getDark() : Themes.getLight(),
      initialRoute: LoginScreen.routeName,
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
