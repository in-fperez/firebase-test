import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Option {
  final String name;
  final void Function(String? optionName) onChanged;
  Option({
    required this.name,
    required this.onChanged,
  });
}

class OptionsListWidget extends StatefulWidget {
  final List<Option> options;
  final String defaultSelected;
  const OptionsListWidget(
      {Key? key, required this.options, required this.defaultSelected})
      : super(key: key);

  @override
  State<OptionsListWidget> createState() => _OptionsListWidgetState();
}

class _OptionsListWidgetState extends State<OptionsListWidget> {
  late String currentSelected = widget.defaultSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, bottom: 24),
      child: Column(
        children: this.getList(),
      ),
    );
  }

  List<Widget> getList() {
    return widget.options.map(
      (option) {
        return ListTile(
          title: Text(option.name),
          leading: Radio(
            activeColor: Theme.of(context).colorScheme.tertiary,
            value: option.name,
            onChanged: (dynamic a) {
              setState(
                () {
                  this.currentSelected = a;
                },
              );
            },
            groupValue: this.currentSelected,
          ),
        );
      },
    ).toList();
  }
}
