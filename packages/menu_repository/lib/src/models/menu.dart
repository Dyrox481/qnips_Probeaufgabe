import 'package:equatable/equatable.dart';
import 'package:qnips_http_api/qnips_http_api.dart';

class Menu extends Equatable {
  const Menu({
    required this.allergens,
    required this.products,
    required this.menuRows,
  });

  final List<Allergen> allergens;
  final List<Product> products;
  final List<MenuRow> menuRows;

  @override
  List<Object> get props => [allergens, products, menuRows];
}
