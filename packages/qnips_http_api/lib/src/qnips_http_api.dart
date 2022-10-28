import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/menu.dart';

/// Exception thrown when menu request fails.
class MenuRequestFailure implements Exception {}

class QnipsHttpApi {
  QnipsHttpApi();

  static const _baseUrl = 'https://my.qnips.io';
  static const _path = '/dbapi/ha';

  /// Get Menu from api
  Future<Menu> getMenu() async {
    final menuResponse = await http.get(Uri.parse('$_baseUrl$_path'));

    if (menuResponse.statusCode != 200) {
      throw MenuRequestFailure();
    }

    final menuJson = jsonDecode(menuResponse.body) as Map<String, dynamic>;

    return Menu.fromJson(menuJson);
  }
}
