import 'package:firebase_testv2/firestore/firestore_instance.dart';
import 'package:firebase_testv2/models/product.dart';

class ProductService {
  static Future<List<Product>> fetchProducts() async {
    var event = await firestore.collection('products').limit(10).get();
    List<Product> products = [];
    for (var doc in event.docs) {
      products.add(Product.fromFirebaseMap(doc.id, doc));
    }
    return products;
  }
}
