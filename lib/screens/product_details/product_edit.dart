import 'package:firebase_testv2/models/product.dart';
import 'package:firebase_testv2/screens/login_screen/login_screen.dart';
import 'package:firebase_testv2/screens/widgets/app_layout/app_layout_widget.dart';
import 'package:firebase_testv2/screens/widgets/app_layout/widgets/divider_widget.dart';
import 'package:firebase_testv2/screens/widgets/button/submit_button_widget.dart';
import 'package:firebase_testv2/screens/widgets/input_text/input_text_widget.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class ProductEditScreen extends StatefulWidget {
  const ProductEditScreen({Key? key, required this.product}) : super(key: key);
  static const routeName = '/product_edit';
  final Product product;
  @override
  State<ProductEditScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductEditScreen>
    with TickerProviderStateMixin {
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
    final TabController tabController = TabController(length: 3, vsync: this);
    return AppLayoutWidget(
      title: "Ficha",
      shouldBeLogged: true,
      showBottomNavigationBar: true,
      body: ListView(children: [
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Image(
                image: AssetImage('images/lixchair.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 7),
                      child: Text(
                        widget.product.id.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          letterSpacing: 0.15,
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, bottom: 7),
                      child: Text(
                        "Color roja patas metalizadas",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 0.15,
                        ),
                      ),
                    ),
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(17, 0, 0, 8),
                        child: Chip(label: Text('')),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.local_print_shop_outlined,
                          color: ColorConstants.accentColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star_border_outlined,
                          color: ColorConstants.accentColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.crop_free_rounded,
                          color: ColorConstants.accentColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert,
                          color: ColorConstants.accentColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        TabBar(
          tabs: const [
            Tab(
              text: 'FICHA',
            ),
            Tab(
              text: 'AVISOS',
            ),
            Tab(
              text: 'MENCIONES',
            ),
          ],
          controller: tabController,
          labelColor: ColorConstants.accentColor,
          indicatorColor: ColorConstants.accentColor,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 10),
          unselectedLabelColor: ColorConstants.ternaryColor,
        ),
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
        ListTile(
          title: const Text("Palet EUR (1200 x 800)"),
          leading: Radio(
            value: "Palet EUR (1200 x 800)",
            onChanged: (String? string) {},
            groupValue: 'paletType',
          ),
        ),
        ListTile(
          title: const Text("Palet EUR (800 x 600)"),
          leading: Radio(
            value: "Palet EUR (800 x 600)",
            onChanged: (String? string) {},
            groupValue: 'paletType',
          ),
        ),
        ListTile(
          title: const Text("Palet Americano (1000 x 1200)"),
          leading: Radio(
            value: "Palet Americano (1000 x 1200)",
            onChanged: (String? string) {},
            groupValue: 'paletType',
          ),
        ),
        ListTile(
          title: const Text("VIL"),
          leading: Radio(
            value: "VIL",
            onChanged: (String? string) {},
            groupValue: 'paletType',
          ),
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
        ListTile(
          title: const Text("Monoreferencia"),
          leading: Radio(
            value: "Monoreferencia",
            onChanged: (String? string) {},
            groupValue: 'referenceType',
          ),
        ),
        ListTile(
          title: const Text("Más de una referencia"),
          leading: Radio(
            value: "Más de una referencia",
            onChanged: (String? string) {},
            groupValue: 'referenceType',
          ),
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
                    color: ColorConstants.accentColor,
                    size: 19,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit_outlined,
                    color: ColorConstants.accentColor,
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
      ]),
    );
  }
}
