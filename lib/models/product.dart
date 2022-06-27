class Product {
  final String? id;
  final double? price;

  Product({
    this.id,
    this.price,
  });

  factory Product.fromFirebaseMap(String id, dynamic map) {
    return Product(
      id: id,
      price: map['price'].toDouble(),
    );
  }
}
