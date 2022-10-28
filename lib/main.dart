import 'package:flutter/material.dart';
import 'package:menu_repository/menu_repository.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MenuApp(
    menuRepository: MenuRepository(),
  ));
}
