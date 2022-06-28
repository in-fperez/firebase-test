import 'package:firebase_testv2/constants/constants.dart';
import 'package:firebase_testv2/screens/login_screen/widgets/custom_text_field.dart';
import 'package:firebase_testv2/screens/login_screen/widgets/submit_button.dart';
import 'package:firebase_testv2/screens/product_list_screen/product_list_screen.dart';
import 'package:flutter/material.dart';

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
            children: const <Widget>[
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 22, 16, 27),
                      child: CustomTextField(hintText: 'E-mail'),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: CustomTextField(
                          hintText: "Password",
                          suffixIcon: Icon(Icons.remove_red_eye_rounded),
                        )),
                  ],
                ),
                SubmitButton(
                  buttonText: 'SIGN IN',
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(ProductsListScreen.routeName);
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
