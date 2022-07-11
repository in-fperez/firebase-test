import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class expansionPanel {
  ExpansionPanel createExpansionPanel(String title, Widget contentTitle,
      Widget contentSubtitle, bool isExpanded) {
    return ExpansionPanel(
      backgroundColor: ColorConstants.secondaryColor,
      canTapOnHeader: true,
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              letterSpacing: 0.15,
            ),
          ),
        );
      },
      body: ListTile(
        title: contentTitle,
        subtitle: contentSubtitle,
      ),
      isExpanded: isExpanded,
    );
  }
}
