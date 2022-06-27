import 'package:firebase_testv2/cubit/product_list/product_list_cubit.dart';
import 'package:firebase_testv2/screens/product_list_screen/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      backgroundColor: const Color(0xFFE5FFE7),
      appBar: AppBar(),
      body: BlocBuilder<ProductsListCubit, ProductListState>(
        builder: ((context, state) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: ListView(
                    children: state.products
                        .map((product) => ProductCard(
                              product: product,
                            ))
                        .toList(),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
