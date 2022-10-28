import 'dart:async';

import 'package:menu_repository/menu_repository.dart';
import 'package:qnips_http_api/qnips_http_api.dart' hide Menu;

class MenuRepository {
  MenuRepository({QnipsHttpApi? menuApi})
      : _menuApi = menuApi ?? QnipsHttpApi();

  final QnipsHttpApi _menuApi;

  Future<Menu> getMenu() async {
    final menu = await _menuApi.getMenu();

    return Menu(
      allergens: menu.allergens.values.toList(),
      products: menu.products.values.toList(),
      menuRows: menu.menuRows,
    );
  }
}
