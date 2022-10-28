import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:menu_repository/menu_repository.dart';
import 'package:qnips_probeaufgabe/src/core/constants.dart';
import 'package:qnips_probeaufgabe/src/menu/view/menu_page.dart';

class MenuApp extends StatelessWidget {
  const MenuApp({
    super.key,
    required MenuRepository menuRepository,
  }) : _menuRepository = menuRepository;

  final MenuRepository _menuRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _menuRepository,
      child: const MenuAppView(),
    );
  }
}

class MenuAppView extends StatelessWidget {
  const MenuAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF04cf84)),
          tabBarTheme: const TabBarTheme(
              labelColor: indicatorColor, unselectedLabelColor: Colors.white),
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.white))),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const MenuPage(),
    );
  }
}
