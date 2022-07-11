import 'package:flutter/material.dart';

import 'package:firebase_testv2/constants/constants.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({
    Key? key,
    required this.items,
    required this.onChanged,
    this.title,
    this.selected,
    this.label = "label",
    this.value = "value",
  }) : super(key: key);
  final List<dynamic> items;
  final String? title;
  final dynamic selected;
  final String? label;
  final String? value;
  final void Function(dynamic) onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
        child: Container(
          height: 43,
          decoration: BoxDecoration(color: ColorConstants.secondaryColor),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: this.selected,
              borderRadius: BorderRadius.circular(4),
              dropdownColor: ColorConstants.secondaryColor,
              hint: Padding(
                padding: EdgeInsets.fromLTRB(10, 8.5, 35, 8.5),
                child: Text(
                  this.title ?? this.items[0]?[this.label],
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.25,
                  ),
                ),
              ),
              items: this.items.map<DropdownMenuItem>((value) {
                return DropdownMenuItem(
                  value: value[this.value],
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8.5, 35, 8.5),
                    child: Text(
                      value[this.label],
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: 0.15,
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: this.onChanged,
            ),
          ),
        ),
      ),
    );
  }
}
