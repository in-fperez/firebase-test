import 'package:firebase_testv2/screens/login_screen/widgets/login_inputs_widget.dart';
import 'package:firebase_testv2/screens/login_screen/widgets/login_submit_button_widget.dart';
import 'package:firebase_testv2/screens/product_list_screen/product_list_screen.dart';
import 'package:firebase_testv2/screens/task_list_screen/task_list_screen.dart';
import 'package:firebase_testv2/screens/widgets/app_layout/app_layout_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/context/context_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  @override
  void dispose() {
    this.emailTextController.dispose();
    this.passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var contextCubit = BlocProvider.of<ContextCubit>(context);
    return AppLayoutWidget(
      title: "Log in",
      shouldBeLogged: false,
      showBottomNavigationBar: false,
      body: Column(
        children: [
          const Expanded(
            flex: 3,
            child: Image(
              image: AssetImage('images/login.jpg'),
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                LoginInputsWidget(
                  emailTextController: this.emailTextController,
                  passwordTextController: this.passwordTextController,
                ),
                LoginSubmitButtonWidget(
                  onSubmit: () async {
                    var email = this.emailTextController.text;
                    var password = this.passwordTextController.text;
                    contextCubit.login(
                      email: email,
                      password: password,
                      context: context,
                    );
                    Navigator.of(context).pushNamed(
                      TaskListScreen.routeName,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
