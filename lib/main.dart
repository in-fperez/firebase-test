import 'package:firebase_testv2/screens/form_screen.dart';
import 'package:firebase_testv2/services/firestore.dart';
import 'package:firebase_testv2/services/models.dart';
import 'package:firebase_testv2/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Product>>(
      create: (_) => FirestoreService().streamProduct(),
      catchError: (_, err) => [Product()],
      initialData: [Product()],
      child: MaterialApp(
        title: 'Firebase Test',
        home: Builder(
          builder: (context) => Scaffold(
            floatingActionButton: FloatingActionButton(
              child: const FaIcon(FontAwesomeIcons.plus),
              backgroundColor: Colors.pinkAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductForm()),
                );
              },
            ),
            body: ProductCardList(),
          ),
        ),
        theme: ThemeData(
          fontFamily: 'Roboto',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: const ColorScheme.light().copyWith(primary: Colors.red),
        ),
      ),
    );
  }
}

class ProductCardList extends StatelessWidget {
  const ProductCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> productList = Provider.of<List<Product>>(context);
    return ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ProductCard(
              productList[index].image,
              productList[index].description,
              productList[index].name,
              productList[index].price);
        });
  }
}
