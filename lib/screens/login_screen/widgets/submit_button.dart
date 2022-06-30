import 'package:firebase_testv2/constants/constants.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton(
      {Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 30.0, 30.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: ColorConstants.accentColor,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            ),
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.25,
                color: ColorConstants.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
