import 'package:flutter/material.dart';

import 'package:firebase_testv2/constants/constants.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  ButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).colorScheme.tertiary),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      onPressed: () {
        this.onPressed();
      },
    );
  }
}
