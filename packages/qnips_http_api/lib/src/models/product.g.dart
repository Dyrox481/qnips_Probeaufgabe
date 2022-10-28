// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productId: json['ProductId'] as int,
      allergenIds: (json['AllergenIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      name: json['Name'] as String,
      price: json['Price'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'allergenIds': instance.allergenIds,
      'name': instance.name,
      'price': instance.price,
    };
