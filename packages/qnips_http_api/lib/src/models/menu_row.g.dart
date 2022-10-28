// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_row.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuRow _$MenuRowFromJson(Map<String, dynamic> json) => MenuRow(
      name: json['Name'] as String,
      days: (json['Days'] as List<dynamic>)
          .map((e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuRowToJson(MenuRow instance) => <String, dynamic>{
      'name': instance.name,
      'days': instance.days,
    };
