import 'package:firebase_testv2/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key, required this.actualIndex})
      : super(key: key);
  final int actualIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: ColorConstants.accentColor,
      unselectedItemColor: Colors.white,
      currentIndex: actualIndex,
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
