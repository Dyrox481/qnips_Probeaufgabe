// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) => Menu(
      allergens: (json['Allergens'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Allergen.fromJson(e as Map<String, dynamic>)),
      ),
      products: (json['Products'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Product.fromJson(e as Map<String, dynamic>)),
      ),
      menuRows: (json['Rows'] as List<dynamic>)
          .map((e) => MenuRow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'allergens': instance.allergens,
      'products': instance.products,
      'menuRows': instance.menuRows,
    };
