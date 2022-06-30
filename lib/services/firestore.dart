import 'dart:async';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_testv2/services/models.dart';

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
      const oneMegabyte = 1024 * 1024;
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
}
