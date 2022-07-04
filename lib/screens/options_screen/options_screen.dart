import 'package:firebase_testv2/cubit/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({Key? key}) : super(key: key);
  static const routeName = '/options';
  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menú de ajustes"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(35, 18, 0, 16),
            child: const Text(
              "Avisos",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 0.25,
              ),
            ),
          ),
          const Divider(
            height: 1,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(35, 28, 0, 20),
            child: const Text(
              "Vertical",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 0.25,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, bottom: 24),
            child: Column(
              children: [
                ListTile(
                  title: const Text("SKLUM"),
                  leading: Radio(
                    value: "SKLUM",
                    onChanged: (String? string) {},
                    groupValue: 'VERTICAL',
                  ),
                ),
                ListTile(
                  title: const Text("CREATE"),
                  leading: Radio(
                    value: "CREATE",
                    onChanged: (String? string) {},
                    groupValue: 'VERTICAL',
                  ),
                ),
                ListTile(
                  title: const Text("THE MASIE"),
                  leading: Radio(
                    value: "THE MASIE",
                    onChanged: (String? string) {},
                    groupValue: 'VERTICAL',
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(35, 26, 0, 20),
            child: const Text(
              "Almacén",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 0.25,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, bottom: 30),
            child: Column(
              children: [
                ListTile(
                  title: const Text("ALM"),
                  leading: Radio(
                    value: "ALM",
                    onChanged: (String? string) {},
                    groupValue: 'ALMACÉN',
                  ),
                ),
                ListTile(
                  title: const Text("VIL"),
                  leading: Radio(
                    value: "VIL",
                    onChanged: (String? string) {},
                    groupValue: 'ALMACÉN',
                  ),
                ),
                ListTile(
                  title: const Text("REA"),
                  leading: Radio(
                    value: "REA",
                    onChanged: (String? string) {},
                    groupValue: 'ALMACÉN',
                  ),
                ),
                ListTile(
                  title: const Text("MON"),
                  leading: Radio(
                    value: "MON",
                    onChanged: (String? string) {},
                    groupValue: 'ALMACÉN',
                  ),
                ),
                ListTile(
                  title: const Text("VE1"),
                  leading: Radio(
                    value: "VE1",
                    onChanged: (String? string) {},
                    groupValue: 'ALMACÉN',
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(36, 20, 0, 21),
                child: const Text(
                  "Dark mode",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.25,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 25, 28, 22),
                child: Switch(
                  value: true,
                  onChanged: (bool value) {
                    theme.changeTheme();
                  },
                ),
              ),
            ],
          ),
          const Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}
