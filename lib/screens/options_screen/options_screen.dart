import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../login_screen/widgets/custom_text_field.dart';
import '../login_screen/widgets/submit_button.dart';
import '../product_list_screen/product_list_screen.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({Key? key}) : super(key: key);
  static const routeName = '/options';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menú de ajustes"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(35, 18, 0, 16),
            child: Text(
              "Avisos",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 0.25,
                color: ColorConstants.ternaryColor,
              ),
            ),
          ),
          Divider(
            height: 1,
            color: ColorConstants.secondaryColor,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(35, 28, 0, 20),
            child: Text(
              "Vertical",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 0.25,
                color: ColorConstants.ternaryColor,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, bottom: 24),
            child: Column(
              children: [
                ListTile(
                  title: Text("SKLUM"),
                  leading: Radio(
                    value: "SKLUM",
                    onChanged: (String? string) {},
                    groupValue: 'VERTICAL',
                  ),
                ),
                ListTile(
                  title: Text("CREATE"),
                  leading: Radio(
                    value: "CREATE",
                    onChanged: (String? string) {},
                    groupValue: 'VERTICAL',
                  ),
                ),
                ListTile(
                  title: Text("THE MASIE"),
                  leading: Radio(
                    value: "THE MASIE",
                    onChanged: (String? string) {},
                    groupValue: 'VERTICAL',
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: ColorConstants.secondaryColor,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(35, 26, 0, 20),
            child: Text(
              "Almacén",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 0.25,
                color: ColorConstants.ternaryColor,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, bottom: 30),
            child: Column(
              children: [
                ListTile(
                  title: Text("ALM"),
                  leading: Radio(
                    value: "ALM",
                    onChanged: (String? string) {},
                    groupValue: 'ALMACÉN',
                  ),
                ),
                ListTile(
                  title: Text("VIL"),
                  leading: Radio(
                    value: "VIL",
                    onChanged: (String? string) {},
                    groupValue: 'ALMACÉN',
                  ),
                ),
                ListTile(
                  title: Text("REA"),
                  leading: Radio(
                    value: "REA",
                    onChanged: (String? string) {},
                    groupValue: 'ALMACÉN',
                  ),
                ),
                ListTile(
                  title: Text("MON"),
                  leading: Radio(
                    value: "MON",
                    onChanged: (String? string) {},
                    groupValue: 'ALMACÉN',
                  ),
                ),
                ListTile(
                  title: Text("VE1"),
                  leading: Radio(
                    value: "VE1",
                    onChanged: (String? string) {},
                    groupValue: 'ALMACÉN',
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: ColorConstants.secondaryColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(36, 20, 0, 21),
                child: Text(
                  "Dark mode",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.25,
                    decoration: TextDecoration.underline,
                    color: ColorConstants.ternaryColor,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 25, 28, 22),
                child: Switch(
                  activeColor: ColorConstants.accentColor,
                  value: true,
                  onChanged: (bool value) {},
                ),
              ),
            ],
          ),
          Divider(
            height: 1,
            color: ColorConstants.secondaryColor,
          ),
        ],
      ),
    );
  }
}
