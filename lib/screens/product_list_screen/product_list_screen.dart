import 'package:firebase_testv2/cubit/product_list/product_list_cubit.dart';
import 'package:firebase_testv2/screens/global_widgets/lateral_menu.dart';
import 'package:firebase_testv2/screens/product_list_screen/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';
import '../global_widgets/bottom_navigation_bar.dart';
import '../global_widgets/dropdown_button.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({Key? key}) : super(key: key);
  static const routeName = 'products_list';

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  final inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductsListCubit>(context).fetchProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Listing"),
      ),
      drawer: LateralMenu(),
      body: BlocBuilder<ProductsListCubit, ProductListState>(
        builder: ((context, state) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: CustomDropdownButton(
                      hintText: "Filtro",
                      itemOptions: ["TODAS"],
                      functionOnchange: (String? string) {},
                    ),
                  ),
                  CustomDropdownButton(
                    hintText: "Ordenación",
                    itemOptions: [
                      'Fecha (antiguo primero)',
                      'Fecha (nuevo primero)',
                      'Novedades',
                      'Personalizado'
                    ],
                    functionOnchange: (String? string) {},
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(color: ColorConstants.secondaryColor),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Text(
                              "Nombre",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                letterSpacing: 0.15,
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_down_sharp)
                          ],
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Text(
                              "Almacén",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                letterSpacing: 0.15,
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_down_sharp)
                          ],
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Text(
                              "Fecha",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                letterSpacing: 0.15,
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_down_sharp)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        ProductCard(product: state.products[index]),
                        Divider(
                          height: 1,
                          color: ColorConstants.secondaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
      bottomNavigationBar: const CustomBottomBar(
        actualIndex: 0,
      ),
    );
  }
}
