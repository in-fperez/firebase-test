import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    List<Widget> widgets = [
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
        onTap: () {},
      ),
    ];
    if (this.shouldBeLogged) {
      widgets = [
        ...widgets,
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Log Out'),
          onTap: () {},
        ),
      ];
    }
    return widgets;
  }
}
