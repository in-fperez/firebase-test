import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_testv2/services/models.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final storageRef = FirebaseStorage.instance.ref();

  Stream<List<Product>> streamProduct() {
    var ref = _db.collection('products');
    return ref.snapshots().map((perole) =>
        perole.docs.map((doc) => Product.fromJson(doc.data())).toList());
  }

  Future<Uint8List?> getProductImages(String namePath) async {
    final imageRef = storageRef.child('images/${namePath}');
    try {
      const oneMegabyte = 2024 * 1024;
      final Uint8List? data = await imageRef.getData(oneMegabyte);
      return data;
    } on FirebaseException catch (e) {
      print(e);
    }
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
    final imagesRef = storageRef.child('images/${imagePath.name}');
    String filePath = imagePath.path;
    File file = File(filePath);

    try {
      await imagesRef.putFile(file);
    } catch (e) {
      print(e);
    }
  }

  Future<void> downloadImages() async {
    final imagesList = await listAllImages();
    for (var image in imagesList.items) {
      try {
        final imagesRef = storageRef.child("images/${image.name}");
        final appDir = await getApplicationDocumentsDirectory();
        final file = File('${appDir.path}/${image.name}');
        final downloadTask = await imagesRef.writeToFile(file);
      } catch (e) {
        print(e);
      }
    }
  }

  Future<ListResult> listAllImages() async {
    final imagesRef = storageRef.child('images');
    final listRef = await imagesRef.listAll();
    return listRef;
  }
}
