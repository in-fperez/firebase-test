import 'package:firebase_testv2/constants/constants.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: ColorConstants.accentColor,
      unselectedItemColor: Colors.white,
      currentIndex: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_sharp),
          label: "List",
          backgroundColor: ColorConstants.secondaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.insert_drive_file_outlined),
          label: "File",
          backgroundColor: ColorConstants.secondaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
          backgroundColor: ColorConstants.secondaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner),
          label: "Scan",
          backgroundColor: ColorConstants.secondaryColor,
        ),
      ],
    );
  }
}
