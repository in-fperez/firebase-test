import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_testv2/screens/product_list_screen/widgets/product_list_widget.dart';
import 'package:firebase_testv2/screens/widgets/app_layout/app_layout_widget.dart';
import 'package:firebase_testv2/bloc/product_list/product_list_cubit.dart';
import 'package:firebase_testv2/constants/constants.dart';

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({Key? key}) : super(key: key);
  static const routeName = 'products_list';

  @override
  Widget build(BuildContext context) {
    var productListCubit = BlocProvider.of<ProductListCubit>(context);
    productListCubit.initListener();
    return AppLayoutWidget(
      title: "Listing",
      shouldBeLogged: true,
      showBottomNavigationBar: true,
      body: BlocBuilder<ProductListCubit, ProductListState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Padding(
              padding: const EdgeInsets.only(top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  "Nombre",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
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
                              children: [
                                Text(
                                  "Almacén",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
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
                              children: [
                                Text(
                                  "Fecha",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
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
                    child: ProductListWidget(
                      products: productListCubit.getProducts(),
                      isCard: true,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
