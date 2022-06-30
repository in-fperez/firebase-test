import 'package:firebase_testv2/cubit/product_list/product_list_cubit.dart';
import 'package:firebase_testv2/screens/global_widgets/lateral_menu.dart';
import 'package:firebase_testv2/screens/product_list_screen/product_list_draggable_card.dart';
import 'package:firebase_testv2/screens/product_list_screen/widgets/product_list_element.dart';
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
      drawer: const LateralMenu(),
      body: BlocBuilder<ProductsListCubit, ProductListState>(
        builder: ((context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomDropdownButton(
                      hintText: "Filtro",
                      itemOptions: const ["Filtro", "TODAS", "Test"],
                      functionOnchange: (String? string) {
                        switch (string) {
                          case 'Test':
                            Navigator.of(context).pushNamed(
                                ProductsListDraggableScreen.routeName);
                        }
                      },
                    ),
                  ),
                  CustomDropdownButton(
                    hintText: "Ordenación",
                    itemOptions: const [
                      "Ordenación",
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
                        onPressed: () {
                          BlocProvider.of<ProductsListCubit>(context)
                              .orderById();
                        },
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
                        ProductListElement(product: state.products[index]),
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
