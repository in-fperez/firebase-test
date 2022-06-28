import 'package:firebase_testv2/cubit/product_list/product_list_cubit.dart';
import 'package:firebase_testv2/screens/product_list_screen/widgets/product_card.dart';
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
    BlocProvider.of<ProductsListCubit>(context).fetchProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Listing"),
      ),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: Drawer(
          backgroundColor: ColorConstants.secondaryColor,
          child: ListView(
            // padding: const EdgeInsets.symmetric(vertical: ),
            children: const <Widget>[
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
              ),
            ],
          ),
        ),
      ),
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
                    padding: const EdgeInsets.all(12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        decoration:
                            BoxDecoration(color: ColorConstants.secondaryColor),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: const Padding(
                              padding: EdgeInsets.fromLTRB(10, 8.5, 59, 8.5),
                              child: Text(
                                "Filtro",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ),
                            items: <String>[
                              'TODAS',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    letterSpacing: 0.15,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {},
                          ),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      decoration:
                          BoxDecoration(color: ColorConstants.secondaryColor),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: const Padding(
                            padding: EdgeInsets.fromLTRB(10, 8.5, 0, 8.5),
                            child: Text(
                              "Ordenación",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                letterSpacing: 0.25,
                              ),
                            ),
                          ),
                          items: <String>[
                            'Fecha (antiguo primero)',
                            'Fecha (nuevo primero)',
                            'Novedades',
                            'Personalizado'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: 0.15,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {},
                        ),
                      ),
                    ),
                  ),
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
                    itemBuilder: (context, index) =>
                        ProductCard(product: state.products[index]),
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
