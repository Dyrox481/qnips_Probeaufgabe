import 'package:json_annotation/json_annotation.dart';
import 'package:qnips_http_api/qnips_http_api.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu {
  const Menu({
    required this.allergens,
    required this.products,
    required this.menuRows,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  final Map<String, Allergen> allergens;
  final Map<String, Product> products;
  final List<MenuRow> menuRows;
}
