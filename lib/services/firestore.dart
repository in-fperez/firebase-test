import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_testv2/main.dart';
import 'package:firebase_testv2/services/models.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final storageRef = FirebaseStorage.instance.ref();

  Stream<List<Product>> streamProduct() {
    var ref = _db.collection('products');
    return ref.snapshots().map((perole) => perole.docs.map((doc) => Product.fromJson(doc.data())).toList());
  }

  Future<Uint8List?> getProductImages(String namePath) async {
    final imageRef = storageRef.child('images/$namePath');
    try {
      const oneMegabyte = 2024 * 1024;
      final Uint8List? data = await imageRef.getData(oneMegabyte);
      return data;
    } on FirebaseException catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> uploadProduct(Product productToUpload) async {
    final productsRef = _db.collection('products').withConverter<Product>(
          fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
          toFirestore: (product, _) => product.toJson(),
        );
    await productsRef.add(
      Product(
        name: productToUpload.name,
        image: productToUpload.image,
        price: productToUpload.price,
        description: productToUpload.description,
      ),
    );
  }

  Future<void> uploadImage(XFile imagePath) async {
    print(imagePath.path);
    final imagesRef = storageRef.child('images/${imagePath.name}');
    String filePath = imagePath.path;
    File file = File(filePath);

    try {
      await imagesRef.putFile(file);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> downloadImages() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    try {
      final imagesList = await getTotalImagesToDownload();
      cubit.updateCalculatingImagesToDownload();
      final appDir = await getApplicationDocumentsDirectory();
      await Directory('${appDir.path}/images/').create(recursive: true);
      for (var image in imagesList) {
        final imagesRef = storageRef.child(image);
        final file = File('${appDir.path}/$image');
        await imagesRef.writeToFile(file);
        cubit.updateCount();
        print(cubit.downloadedImages);
        cubit.updatePercentDownload();
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<String>> getTotalImagesToDownload() async {
    final imagesRef = storageRef.child('images');
    final appDir = await getApplicationDocumentsDirectory();
    final listRef = await imagesRef.listAll();
    List<String> imagesToDownload = [];
    for (var image in listRef.items) {
      if (await File('${appDir.path}/${image.fullPath}').exists() == false) {
        cubit.totalImages++;
        imagesToDownload.add(image.fullPath);
      }
    }
    return imagesToDownload;
  }
}
