import 'package:animations/animations.dart';
import 'package:firebase_testv2/screens/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomFABWidget extends StatelessWidget {
  const CustomFABWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 500),
      openBuilder: (context, _) => ProductForm(),
      closedColor: Theme.of(context).primaryColor,
      closedShape: const CircleBorder(),
      closedBuilder: (context, openContainer) => Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.pinkAccent,
        ),
        height: 56,
        width: 56,
        child: const Center(
          child: FaIcon(FontAwesomeIcons.plus, color: Colors.white),
        ),
      ),
    );
  }
}
