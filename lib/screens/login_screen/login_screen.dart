import 'package:firebase_testv2/constants/constants.dart';
import 'package:firebase_testv2/cubit/internet/internet_cubit.dart';
import 'package:firebase_testv2/screens/login_screen/widgets/custom_text_field.dart';
import 'package:firebase_testv2/screens/login_screen/widgets/submit_button.dart';
import 'package:firebase_testv2/screens/options_screen/options_screen.dart';
import 'package:firebase_testv2/screens/product_list_screen/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in"),
      ),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: Drawer(
          backgroundColor: ColorConstants.secondaryColor,
          child: ListView(
            // padding: const EdgeInsets.symmetric(vertical: ),
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {
                  Navigator.of(context).pushNamed(OptionsScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
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
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 22, 20, 27),
                      child: CustomTextField(hintText: "Usuario"),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: CustomTextField(
                          hintText: "Contraseña",
                        )),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: SubmitButton(
                    buttonText: 'Entrar',
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(ProductsListScreen.routeName);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
