import 'package:firebase_testv2/cubit/product_list/product_list_cubit.dart';
import 'package:firebase_testv2/screens/global_widgets/lateral_menu.dart';
import 'package:firebase_testv2/screens/product_list_screen/widgets/product_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';
import '../global_widgets/bottom_navigation_bar.dart';
import '../global_widgets/dropdown_button.dart';

class ProductsListDraggableScreen extends StatefulWidget {
  const ProductsListDraggableScreen({Key? key}) : super(key: key);
  static const routeName = 'products_list_draggable';

  @override
  State<ProductsListDraggableScreen> createState() =>
      _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListDraggableScreen> {
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
                      itemOptions: const ["Filtro", "TODAS"],
                      functionOnchange: (String? string) {},
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
              Expanded(
                child: Center(
                  child: ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        ProductListCard(product: state.products[index]),
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
