import 'package:json_annotation/json_annotation.dart';

part 'allergen.g.dart';

@JsonSerializable()
class Allergen {
  const Allergen({
    required this.id,
    required this.label,
  });

  factory Allergen.fromJson(Map<String, dynamic> json) =>
      _$AllergenFromJson(json);

  final String id;
  final String label;
}
