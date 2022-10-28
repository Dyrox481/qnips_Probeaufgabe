import 'package:json_annotation/json_annotation.dart';

part 'day.g.dart';

@JsonSerializable()
class Day {
  const Day({
    required this.weekday,
    required this.productIds,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  final int weekday;
  final List<Map> productIds;
}
