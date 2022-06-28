import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton(
      {Key? key,
      required this.hintText,
      required this.itemOptions,
      required this.functionOnchange})
      : super(key: key);
  final String hintText;
  final List<String> itemOptions;
  final void Function(String?) functionOnchange;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        decoration: BoxDecoration(color: ColorConstants.secondaryColor),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: Padding(
              padding: EdgeInsets.fromLTRB(10, 8.5, 59, 8.5),
              child: Text(
                hintText,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  letterSpacing: 0.25,
                ),
              ),
            ),
            items: itemOptions.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.15,
                  ),
                ),
              );
            }).toList(),
            onChanged: functionOnchange,
          ),
        ),
      ),
    );
  }
}
