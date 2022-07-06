import 'package:cloud_firestore/cloud_firestore.dart';
import '../firestore/firestore_instance.dart';
import '../models/product.dart';

class ProductService {
  static void initProductSnapshotsListener(
    void Function(
      List<Product> products,
      List<Product> addedProducts,
      List<Product> modifiedProducts,
      List<String> productRemovedIds,
    )
        onProductsAddedOrModified,
  ) {
    firestore.collection('products').snapshots().listen(
      (snapshot) {
        List<Product> products = snapshot.docs
            .map((doc) => Product.fromFirebaseMap(doc.id, doc.data()))
            .toList();
        List<Product> addedProducts = [];
        List<Product> modifiedProducts = [];
        List<String> productRemovedIds = [];

        for (var docChange in snapshot.docChanges) {
          String id = docChange.doc.id;
          if (docChange.type.name == DocumentChangeType.added.name) {
            addedProducts.add(Product.fromFirebaseMap(id, docChange.doc));
          } else if (docChange.type.name == DocumentChangeType.modified.name) {
            modifiedProducts.add(Product.fromFirebaseMap(id, docChange.doc));
          } else if (docChange.type.name == DocumentChangeType.removed.name) {
            productRemovedIds.add(id);
          }
        }
        onProductsAddedOrModified(
          products,
          addedProducts,
          modifiedProducts,
          productRemovedIds,
        );
      },
    );
  }
}
