import 'package:firebase_testv2/cubit/product_list/product_list_cubit.dart';
import 'package:firebase_testv2/screens/product_list_screen/constants/product_options_constants.dart';
import 'package:firebase_testv2/screens/product_list_screen/widgets/product_list_widget.dart';
import 'package:firebase_testv2/screens/widgets/app_layout/app_layout_widget.dart';
import 'package:firebase_testv2/screens/widgets/dropdown/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    var productListCubit = BlocProvider.of<ProductListCubit>(context);

    return AppLayoutWidget(
      title: "Listing",
      shouldBeLogged: true,
      showBottomNavigationBar: true,
      body: BlocBuilder<ProductListCubit, ProductListState>(
        builder: ((context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: DropdownWidget(
                      title: "Filtro",
                      items: productFilteringOptions,
                      selected: state.filter?['id'],
                      value: 'id',
                      onChanged: (id) {
                        if (id != null) {
                          productListCubit.updateFilter(id);
                        }
                      },
                    ),
                  ),
                  DropdownWidget(
                    title: "Ordenación",
                    items: productOrderingOptions,
                    selected: state.ordering?["id"],
                    value: 'id',
                    onChanged: (id) {
                      if (id != null) {
                        productListCubit.updateOrdering(id);
                      }
                    },
                  )
                ],
              ),
              Expanded(
                child: ProductListWidget(
                  products: productListCubit.getProducts(),
                  isCard: true,
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
