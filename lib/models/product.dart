class Product {
  String id;
  DateTime dateUpd;
  String name;
  String warehouse;

  Product(
      {required this.id,
      required this.dateUpd,
      required this.name,
      required this.warehouse});

  factory Product.fromFirebaseMap(String id, dynamic map) {
    return Product(
      id: id,
      dateUpd: DateTime.now(),
      name: map["name"],
      warehouse: map["warehouse"],
    );
  }
}
