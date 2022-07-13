import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_testv2/constants/constants.dart';
import 'package:firebase_testv2/bloc/product_edit/product_edit_cubit.dart';
import 'package:firebase_testv2/models/palet.dart';
import 'package:firebase_testv2/models/reference.dart';
import 'package:firebase_testv2/screens/login_screen/login_screen.dart';
import 'package:firebase_testv2/screens/options_screen/widgets/settings_title_widget.dart';
import 'package:firebase_testv2/screens/widgets/app_layout/widgets/divider_widget.dart';
import 'package:firebase_testv2/screens/widgets/button/submit_button_widget.dart';
import 'package:firebase_testv2/screens/widgets/input_text/input_text_widget.dart';
import 'package:firebase_testv2/screens/widgets/radio_list/radio_list_widget.dart';

class ProductEditWidget extends StatefulWidget {
  const ProductEditWidget({Key? key}) : super(key: key);

  @override
  State<ProductEditWidget> createState() => _ProductEditWidgetState();
}

class _ProductEditWidgetState extends State<ProductEditWidget> {
  TextEditingController paletNameTextController = TextEditingController();
  TextEditingController heigthTextController = TextEditingController();
  TextEditingController widthTextController = TextEditingController();
  TextEditingController lengthTextController = TextEditingController();
  TextEditingController masterboxMeasuresTextController =
      TextEditingController();

  @override
  void dispose() {
    this.paletNameTextController.dispose();
    this.heigthTextController.dispose();
    this.widthTextController.dispose();
    this.lengthTextController.dispose();
    this.masterboxMeasuresTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var productEditCubit = BlocProvider.of<ProductEditCubit>(context);
    var palets = productEditCubit.state.palets;
    var references = productEditCubit.state.references;
    return Column(
      children: [
        SettingsTitleWidget(title: 'AÑADIR PALETIZACIÓN'),
        Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.centerLeft,
          child: const Text(
            'AÑADIR PALETIZACIÓN',
            style: TextStyle(fontSize: 10),
          ),
        ),
        DividerWidget(),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 22, 16, 27),
          child: InputTextWidget(
            placeHolder: 'Nombre de paletización',
            textEditingController: paletNameTextController,
          ),
        ),
        DividerWidget(),
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: const Text(
            'El ancho deberá contemplar la posibilidad de que las cajas sobresalgan de sus límites.',
            style: TextStyle(fontSize: 14, height: 1.5),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 5, 16, 27),
          child: InputTextWidget(
            placeHolder: 'Alto',
            textEditingController: heigthTextController,
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 5, 16, 27),
          child: InputTextWidget(
            placeHolder: 'Ancho',
            suffixIcon: Icon(Icons.info),
            textEditingController: widthTextController,
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 5, 16, 27),
          child: InputTextWidget(
            placeHolder: 'Largo',
            textEditingController: lengthTextController,
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 5, 16, 27),
          child: InputTextWidget(
            placeHolder: 'Medida masterbox',
            textEditingController: masterboxMeasuresTextController,
          ),
        ),
        DividerWidget(),
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Tipo de palets:',
            style: TextStyle(fontSize: 14, height: 1.5),
          ),
        ),
        OptionsListWidget(
          defaultSelected: this.getDefaultSelectedPalet(palets),
          options: palets.map(
            (palet) {
              return Option(
                name: palet.name,
                onChanged: <String>(paletName) {
                  if (paletName != null) {
                    productEditCubit.updateCurrentPalet(
                      productEditCubit.state.palets
                          .firstWhere((pal) => pal.name == paletName),
                    );
                  }
                },
              );
            },
          ).toList(),
        ),
        DividerWidget(),
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Tipo de referencia:',
            style: TextStyle(fontSize: 14, height: 1.5),
          ),
        ),
        OptionsListWidget(
          defaultSelected: this.getDefaultSelectedReference(references),
          options: references.map(
            (reference) {
              return Option(
                name: reference.name,
                onChanged: <String>(referenceName) {
                  if (referenceName != null) {
                    productEditCubit.updateCurrentReference(
                      productEditCubit.state.references
                          .firstWhere((ref) => ref.name == referenceName),
                    );
                  }
                },
              );
            },
          ).toList(),
        ),
        DividerWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Galería:',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.tertiary,
                    size: 19,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit_outlined,
                    color: Theme.of(context).colorScheme.tertiary,
                    size: 19,
                  ),
                ),
              ],
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Image(
            image: AssetImage('images/palet1.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Image(
            image: AssetImage('images/palet2.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        ButtonWidget(
          text: 'Guardar',
          onPressed: () {
            Navigator.of(context).pushNamed(LoginScreen.routeName);
          },
        )
      ],
    );
  }

  String getDefaultSelectedPalet(List<Palet> paletTypes) {
    return paletTypes.isNotEmpty ? paletTypes[0].name : '';
  }

  String getDefaultSelectedReference(List<Reference> references) {
    return references.isNotEmpty ? references[0].name : '';
  }
}
