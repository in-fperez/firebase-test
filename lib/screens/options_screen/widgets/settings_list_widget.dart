import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting {
  final String name;
  final void Function(String? settingName) onChanged;
  Setting({
    required this.name,
    required this.onChanged,
  });
}

class SettingsListWidget extends StatefulWidget {
  final List<Setting> settings;
  final String defaultSelected;
  const SettingsListWidget(
      {Key? key, required this.settings, required this.defaultSelected})
      : super(key: key);

  @override
  State<SettingsListWidget> createState() => _SettingsListWidgetState();
}

class _SettingsListWidgetState extends State<SettingsListWidget> {
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
    return widget.settings.map(
      (setting) {
        return ListTile(
          title: Text(setting.name),
          leading: Radio(
            value: setting.name,
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
