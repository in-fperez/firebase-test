import 'package:flutter/material.dart';
import 'package:firebase_testv2/screens/widgets/app_layout/widgets/appbar_widget.dart';
import 'package:firebase_testv2/screens/widgets/app_layout/widgets/bottom_navigation_bar_widget.dart';
import 'package:firebase_testv2/screens/widgets/app_layout/widgets/navigation_drawer_widget.dart';

class AppLayoutWidget extends StatelessWidget {
  final String title;
  final bool shouldBeLogged;
  final bool showBottomNavigationBar;
  final Widget body;
  AppLayoutWidget({
    Key? key,
    required this.title,
    required this.shouldBeLogged,
    required this.showBottomNavigationBar,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: this.title,
      ),
      drawer: NavigationDrawerWidget(
        shouldBeLogged: this.shouldBeLogged,
      ),
      body: SafeArea(child: this.body),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar:
          this.showBottomNavigationBar ? BottomNavigationBarWidget() : null,
    );
  }
}
