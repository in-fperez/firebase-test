import 'package:camera/camera.dart';
import 'package:firebase_testv2/cubit/imagesDownload_cubit/images_cubit.dart';
import 'package:firebase_testv2/screens/login_screen.dart';
import 'package:firebase_testv2/services/firestore.dart';
import 'package:firebase_testv2/services/models.dart';
import 'package:firebase_testv2/services/background_service.dart';
import 'package:firebase_testv2/widgets/custom_fab_widget.dart';
import 'package:firebase_testv2/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final cubit = ImagesCubit();
late final cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BackgroundService.initializeApp();
  cameras = await availableCameras();
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
          builder: (context) => const Scaffold(
            floatingActionButton: CustomFABWidget(),
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
  }
}

class ProductCardList extends StatelessWidget {
  const ProductCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> productList = Provider.of<List<Product>>(context);
    return Scaffold(
      floatingActionButton: const CustomFABWidget(),
      body: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductCard(productList[index].image, productList[index].description, productList[index].name,
                productList[index].price);
          }),
    );
  }
}
