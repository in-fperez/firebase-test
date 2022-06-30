import 'package:firebase_testv2/screens/global_widgets/warhouse_pill.dart';
import 'package:firebase_testv2/screens/login_screen/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/product_details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ficha"),
      ),
      body: Column(
        children: [
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
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, bottom: 7),
                        child: Text(
                          "Mesa de comedor Otax",
                          style: TextStyle(
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
                          child: CustomWarehousePill(warehouseName: "VIL"),
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
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 11),
                      child: Text(
                        "AÑADIR PALETIZACIÓN",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            letterSpacing: 1.5),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: ColorConstants.secondaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 20),
                    child: CustomTextField(hintText: "Nombre de paletización"),
                  ),
                  Divider(
                    height: 1,
                    color: ColorConstants.secondaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18, bottom: 24),
                    child: Text(
                      "El ancho deberá contemplar la posibilidad de que las cajas sobresalgan por sus límites",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          letterSpacing: 0.25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 22),
                    child: CustomTextField(hintText: "Alto"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 22),
                    child: CustomTextField(hintText: "Ancho"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 22),
                    child: CustomTextField(hintText: "Largo"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: CustomTextField(hintText: "Medida masterbox"),
                  ),
                  Divider(
                    height: 1,
                    color: ColorConstants.secondaryColor,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 21),
                      child: Text(
                        "Tipo de palets:",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            letterSpacing: 0.15),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, bottom: 30),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("Palet EUR (1200 x 800)"),
                          leading: Radio(
                            value: "EUR",
                            onChanged: (String? string) {},
                            groupValue: 'PALETTYPE',
                          ),
                        ),
                        ListTile(
                          title: Text("Palet EUR6 (800 x 600)"),
                          leading: Radio(
                            value: "EUR6",
                            onChanged: (String? string) {},
                            groupValue: 'PALETTYPE',
                          ),
                        ),
                        ListTile(
                          title: Text("Palet Americano (1000 x 1200)"),
                          leading: Radio(
                            value: "Americano",
                            onChanged: (String? string) {},
                            groupValue: 'PALETTYPE',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
