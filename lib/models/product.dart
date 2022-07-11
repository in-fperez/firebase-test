class Product {
  String id;
  DateTime dateUpd;
  String name;
  double price;
  String warehouse;

  Product(
      {required this.id,
      required this.dateUpd,
      required this.name,
      required this.price,
      required this.warehouse});

  factory Product.fromFirebaseMap(String id, dynamic map) {
    return Product(
      id: id,
      dateUpd: DateTime.parse(map["dateUpd"]),
      name: map["name"],
      price: map['price'].toDouble(),
      warehouse: map["warehouse"],
    );
  }
}
