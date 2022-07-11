import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_testv2/screens/product_list_screen/constants/product_options_constants.dart';
import 'package:firebase_testv2/screens/widgets/dropdown/dropdown_widget.dart';
import 'package:firebase_testv2/cubit/product_list/product_list_cubit.dart';
import 'package:firebase_testv2/constants/constants.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productListCubit = BlocProvider.of<ProductListCubit>(context);
    return FloatingActionButton(
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
                  DropdownWidget(
                    title: "Filtro",
                    items: productFilteringOptions,
                    selected: productListCubit.filterId,
                    value: 'id',
                    onChanged: (id) {
                      if (id != null) {
                        productListCubit.updateFilter(id);
                      }
                    },
                  ),
                  DropdownWidget(
                    title: "Ordenación",
                    value: 'id',
                    items: productOrderingOptions,
                    selected: productListCubit.filterId,
                    onChanged: (id) {
                      if (id != null) {
                        productListCubit.updateOrdering(id);
                      }
                    },
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
    );
  }
}
