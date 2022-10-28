// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      weekday: json['Weekday'] as int,
      productIds: (json['ProductIds'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'weekday': instance.weekday,
      'productIds': instance.productIds,
    };
