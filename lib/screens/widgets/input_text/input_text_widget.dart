import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  final String placeHolder;
  final Icon? suffixIcon;
  final TextEditingController textEditingController;
  InputTextWidget({
    Key? key,
    required this.placeHolder,
    required this.textEditingController,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(4),
        right: Radius.circular(4),
      ),
      child: TextField(
        cursorColor: Theme.of(context).colorScheme.tertiary,
        controller: textEditingController,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          filled: true,
          fillColor: Theme.of(context).colorScheme.surface,
          label: Text(
            this.placeHolder,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 0.15,
                color: Theme.of(context).colorScheme.onSurface),
          ),
          suffixIcon: this.suffixIcon,
        ),
      ),
    );
  }
}
