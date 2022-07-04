import 'package:firebase_testv2/screens/form_screen.dart';
import 'package:firebase_testv2/screens/login_screen.dart';
import 'package:firebase_testv2/services/firestore.dart';
import 'package:firebase_testv2/services/models.dart';
import 'package:firebase_testv2/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workmanager/workmanager.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void callbackDispatcher() {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
                FirestoreService().listAllImages();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductForm()),
                );
              },
            ),
            body: LoginPage(),
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Workmanager().initialize(callbackDispatcher);
  }
}

class ProductCardList extends StatelessWidget {
  const ProductCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> productList = Provider.of<List<Product>>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const FaIcon(FontAwesomeIcons.plus),
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
          FirestoreService().listAllImages();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductForm()),
          );
        },
      ),
      body: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductCard(
                productList[index].image,
                productList[index].description,
                productList[index].name,
                productList[index].price);
          }),
    );
  }
}
