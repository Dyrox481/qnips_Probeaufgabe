import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  const Product({
    required this.productId,
    required this.allergenIds,
    required this.name,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  final int productId;
  final List<String> allergenIds;
  final String name;
  final Map price;
}
