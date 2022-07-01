import 'package:firebase_testv2/models/product.dart';
import 'package:firebase_testv2/screens/global_widgets/bottom_navigation_bar.dart';
import 'package:firebase_testv2/screens/global_widgets/warhouse_pill.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);
  static const routeName = '/product_details';
  final Product product;
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
      body: Column(children: [
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(17, 0, 0, 8),
                        child: CustomWarehousePill(warehouseName: "VIL"),
                      ),
                      Row(
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
                ],
              ),
            ),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
          child: ExpansionPanelList(
            children: [
              ExpansionPanel(
                backgroundColor: ColorConstants.secondaryColor,
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return const ListTile(
                    title: Text(
                      "Paletización",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        letterSpacing: 0.15,
                      ),
                    ),
                  );
                },
                body: const ListTile(
                  title: Text("title?"),
                ),
                isExpanded: true,
              ),
              ExpansionPanel(
                backgroundColor: ColorConstants.secondaryColor,
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return const ListTile(
                    title: Text(
                      "Localización",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        letterSpacing: 0.15,
                      ),
                    ),
                  );
                },
                body: const ListTile(
                  title: Text(""),
                ),
                isExpanded: false,
              ),
            ],
          ),
        )
      ]),
      bottomNavigationBar: CustomBottomBar(actualIndex: 1),
    );
  }
}
