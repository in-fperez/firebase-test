import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.hintText, this.suffixIcon})
      : super(key: key);
  final String hintText;
  final Icon? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(
        left: Radius.circular(4),
        right: Radius.circular(4),
      ),
      child: TextField(
        showCursor: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.secondary,
          label: Text(
            hintText,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              letterSpacing: 0.15,
            ),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
