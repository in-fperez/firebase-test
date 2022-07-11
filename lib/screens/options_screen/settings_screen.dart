import 'package:firebase_testv2/cubit/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_testv2/firestore/firestore_instance.dart';
import 'package:firebase_testv2/screens/widgets/button/submit_button_widget.dart';
import 'package:firebase_testv2/screens/widgets/app_layout/widgets/divider_widget.dart';
import 'package:firebase_testv2/screens/widgets/radio_list/radio_list_widget.dart';
import 'package:firebase_testv2/screens/options_screen/widgets/settings_title_widget.dart';
import 'package:firebase_testv2/constants/constants.dart';
import 'package:firebase_testv2/cubit/context/context_cubit.dart';
import 'package:firebase_testv2/models/vertical.dart';
import 'package:firebase_testv2/models/warehouse.dart';
import 'package:firebase_testv2/screens/widgets/app_layout/app_layout_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const routeName = '/settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var themeCubit = BlocProvider.of<ThemeCubit>(context, listen: false);
    var contextCubit = BlocProvider.of<ContextCubit>(context, listen: false);
    var verticals = contextCubit.state.verticals;
    var warehouses = contextCubit.state.warehouses;
    return BlocBuilder<ContextCubit, ContextState>(builder: (context, state) {
      return AppLayoutWidget(
        title: "Menú de ajustes",
        shouldBeLogged: contextCubit.state.user != null,
        showBottomNavigationBar: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingsTitleWidget(title: "Avisos"),
              DividerWidget(),
              SettingsTitleWidget(title: "Vertical"),
              OptionsListWidget(
                defaultSelected: this.getDefaultSelectedVertical(verticals),
                options: verticals.map(
                  (vertical) {
                    return Option(
                      name: vertical.name,
                      onChanged: <String>(verticalName) {
                        if (verticalName != null) {
                          contextCubit.updateCurrentVertical(
                            contextCubit.state.verticals.firstWhere(
                                (vert) => vert.name == verticalName),
                          );
                        }
                      },
                    );
                  },
                ).toList(),
              ),
              DividerWidget(),
              SettingsTitleWidget(title: "Almacén"),
              Container(
                margin: const EdgeInsets.only(left: 15, bottom: 30),
                child: Column(
                  children: [
                    OptionsListWidget(
                      defaultSelected:
                          this.getDefaultSelectedWarehouse(warehouses),
                      options: warehouses.map(
                        (warehouse) {
                          return Option(
                            name: warehouse.name,
                            onChanged: <String>(warehouseName) {
                              if (warehouseName != null) {
                                contextCubit.updateCurrentWarehouse(
                                  warehouses.firstWhere(
                                      (vert) => vert.name == warehouseName),
                                );
                              }
                            },
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
              ),
              DividerWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(36, 20, 0, 21),
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
                    margin: const EdgeInsets.fromLTRB(0, 25, 28, 22),
                    child: Switch(
                      activeColor: ColorConstants.accentColor,
                      value: themeCubit.state.isDark,
                      onChanged: (bool value) {
                        themeCubit.changeTheme();
                      },
                    ),
                  ),
                ],
              ),
              DividerWidget(),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: ButtonWidget(
                    text: "CLEAN STORAGE",
                    onPressed: () async {
                      firestore.clearPersistence();

                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Borrada"),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  String getDefaultSelectedVertical(List<Vertical> verticals) {
    return verticals.isNotEmpty ? verticals[0].name : '';
  }

  String getDefaultSelectedWarehouse(List<Warehouse> warehouses) {
    return warehouses.isNotEmpty ? warehouses[0].name : '';
  }
}
