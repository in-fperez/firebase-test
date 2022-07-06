class Product {
  final String id;
  final String name;
  final double price;
  final DateTime dateUpd;
  final String warehouse;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.dateUpd,
      required this.warehouse});

  factory Product.fromFirebaseMap(String id, dynamic map) {
    return Product(
      id: id,
      name: map["name"],
      price: map['price'].toDouble(),
      dateUpd: DateTime.parse(map["dateUpd"]),
      warehouse: map["warehouse"],
    );
  }
}
