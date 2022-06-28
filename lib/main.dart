import 'package:firebase_testv2/screens/login_screen/login_screen.dart';
import 'package:firebase_testv2/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const IcemanApp());
}

class IcemanApp extends StatelessWidget {
  const IcemanApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MaterialApp(
      title: 'Iceman App',
      theme: Themes.getLight(),
      darkTheme: Themes.getDark(),
      themeMode: ThemeMode.dark,
      initialRoute: LoginScreen.routeName,
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
