import 'package:firebase_testv2/cubit/product_list/product_list_cubit.dart';
import 'package:firebase_testv2/screens/product_list_screen/widgets/product_list_widget.dart';
import 'package:firebase_testv2/screens/widgets/app_layout/app_layout_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';

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
    var productListCubit = BlocProvider.of<ProductListCubit>(context);
    productListCubit.initListener();
    return AppLayoutWidget(
      title: "Listing",
      shouldBeLogged: true,
      showBottomNavigationBar: true,
      body: BlocBuilder<ProductListCubit, ProductListState>(
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
                      child: ProductListWidget(
                    products: productListCubit.getProducts(),
                    isCard: false,
                  ))
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
