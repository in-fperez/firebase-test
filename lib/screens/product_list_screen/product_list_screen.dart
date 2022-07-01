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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Padding(
              padding: const EdgeInsets.only(top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(color: ColorConstants.secondaryColor),
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
                            Container(
                              color: ((index % 2) == 0)
                                  ? null
                                  : ColorConstants.secondaryColor,
                              child: ProductListElement(
                                  product: state.products[index], index: index),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.accentColor,
        child: Icon(Icons.filter_alt_outlined),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Filtrar"),
              content: Container(
                height: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomDropdownButton(
                      hintText: "Filtro",
                      itemOptions: const ["Filtro", "TODAS", "Test"],
                      functionOnchange: (String? string) {},
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
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, "Cancelar");
                  },
                  child: Text("Cancelar"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, "Aplicar");
                  },
                  child: Text("Aplicar"),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomBar(
        actualIndex: 0,
      ),
    );
  }
}
