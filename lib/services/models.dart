import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Product {
  final String name;
  final double price;
  final String image;
  final String description;

  Product({
    this.name = '',
    this.image = '',
    this.price = 0.0,
    this.description = '',
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
