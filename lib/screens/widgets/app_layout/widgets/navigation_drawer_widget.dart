import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_testv2/screens/options_screen/settings_screen.dart';
import 'package:firebase_testv2/screens/login_screen/login_screen.dart';
import 'package:firebase_testv2/bloc/context/context_cubit.dart';
import 'package:firebase_testv2/constants/constants.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final bool shouldBeLogged;
  const NavigationDrawerWidget({Key? key, required this.shouldBeLogged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Drawer(
        backgroundColor: ColorConstants.secondaryColor,
        child: ListView(
          children: getDrawerListChildren(context),
        ),
      ),
    );
  }

  List<Widget> getDrawerListChildren(BuildContext context) {
    var contextCubit = BlocProvider.of<ContextCubit>(context);
    List<Widget> widgets = [
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
        onTap: () {
          Navigator.of(context).pushNamed(SettingsScreen.routeName);
        },
      ),
    ];
    if (this.shouldBeLogged) {
      widgets = [
        ...widgets,
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Log Out'),
          onTap: () {
            Navigator.of(context).pushNamed(LoginScreen.routeName);
          },
        ),
      ];
    }
    return widgets;
  }
}
