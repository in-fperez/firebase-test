import 'package:flutter/material.dart';

class InputTextPasswordWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  InputTextPasswordWidget({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  @override
  State<InputTextPasswordWidget> createState() =>
      _InputTextPasswordWidgetState();
}

class _InputTextPasswordWidgetState extends State<InputTextPasswordWidget> {
  bool isTextHidden = true;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(4),
        right: Radius.circular(4),
      ),
      child: TextField(
        controller: widget.textEditingController,
        obscureText: this.isTextHidden,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          filled: true,
          fillColor: Color(0xff2F2F2F),
          hintStyle: TextStyle(
              // color: ColorConstants.secondaryColor,
              ),
          label: Text(
            'Password',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              letterSpacing: 0.15,
            ),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  this.isTextHidden = !this.isTextHidden;
                });
              },
              child: Icon(Icons.remove_red_eye_rounded),
            ),
          ),
        ),
      ),
    );
  }
}
