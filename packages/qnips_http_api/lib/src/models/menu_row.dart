import 'package:json_annotation/json_annotation.dart';

import 'day.dart';

part 'menu_row.g.dart';

@JsonSerializable()
class MenuRow {
  const MenuRow({
    required this.name,
    required this.days,
  });

  factory MenuRow.fromJson(Map<String, dynamic> json) =>
      _$MenuRowFromJson(json);

  final String name;
  final List<Day> days;
}
