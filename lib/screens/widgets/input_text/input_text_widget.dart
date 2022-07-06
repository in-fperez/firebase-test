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
        controller: textEditingController,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          filled: true,
          fillColor: Color(0xff2F2F2F),
          hintStyle: TextStyle(
              // color: ColorConstants.secondaryColor,
              ),
          label: Text(
            this.placeHolder,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              letterSpacing: 0.15,
            ),
          ),
          suffixIcon: this.suffixIcon,
        ),
      ),
    );
  }
}
