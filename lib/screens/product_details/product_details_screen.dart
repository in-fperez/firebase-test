import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:firebase_testv2/screens/widgets/expansion_panel/expansion_panel_widget.dart';
import 'package:firebase_testv2/screens/widgets/details_header/details_header.dart';
import 'package:firebase_testv2/screens/widgets/app_layout/app_layout_widget.dart';
import 'package:firebase_testv2/cubit/product_details/product_details_cubit.dart';
import 'package:firebase_testv2/screens/widgets/tab_bar/tab_bar_widget.dart';
import 'package:firebase_testv2/models/product.dart';

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
    var productDetailsCubit = BlocProvider.of<ProductDetailsCubit>(context);
    return AppLayoutWidget(
      title: "Ficha",
      showBottomNavigationBar: true,
      shouldBeLogged: true,
      body: Column(
        children: [
          DetailsHeaderWidget(product: widget.product),
          TabBarWidget(
            tabBarElements: ["Ficha", "Avisos", "Menciones"],
            tabController: tabController,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 18),
                    child: ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        productDetailsCubit.updateExpansionPanel(
                            !isExpanded, index);
                      },
                      children: [
                        expansionPanel().createExpansionPanel(
                            "Paletización",
                            Text("Ejemplo de title"),
                            Text("Ejemplo de body"),
                            productDetailsCubit.state.isExpansionPanelExpanded),
                        expansionPanel().createExpansionPanel(
                            "Localización",
                            Text("Ejemplo de title"),
                            Text("Ejemplo de body"),
                            productDetailsCubit.state.isExpansionPanelExpanded)
                      ],
                    ),
                  ),
                ),
                Container(child: Text('aaaa')),
                Container(child: Text('aaaa')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
