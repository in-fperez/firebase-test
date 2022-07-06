import 'package:flutter/cupertino.dart';

import '../../../constants/constants.dart';

class SettingsTitleWidget extends StatelessWidget {
  final String title;
  const SettingsTitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(35, 26, 0, 20),
      child: Text(
        this.title,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: 0.25,
          color: ColorConstants.ternaryColor,
        ),
      ),
    );
  }
}
