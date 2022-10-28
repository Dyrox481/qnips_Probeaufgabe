import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_repository/menu_repository.dart';
import 'package:qnips_probeaufgabe/src/core/constants.dart';
import 'package:qnips_probeaufgabe/src/menu/cubit/menu_cubit.dart';
import 'package:qnips_probeaufgabe/src/menu/widgets/menu_table.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MenuCubit(context.read<MenuRepository>())..fetchMenu(),
      child: const MenuView(),
    );
  }
}

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return DefaultTabController(
      length: daysToDisplay,
      child: SafeArea(
        top: false,
        left: isLandscape ? true : false,
        right: isLandscape ? true : false,
        bottom: false,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: !isMobile
                ? const Size.fromHeight(0)
                : const Size.fromHeight(50.0),
            child: AppBar(
              elevation: 0,
              bottom: isMobile
                  ? TabBar(
                      indicatorColor: indicatorColor,
                      tabs: [
                        for (int i = 0; i < daysToDisplay; i++)
                          Tab(
                            icon: Text(weekdaysShort[i]),
                          )
                      ],
                    )
                  : null,
            ),
          ),
          body: BlocBuilder<MenuCubit, MenuState>(
            builder: (context, state) {
              switch (state.status) {
                case MenuStatus.initial:
                  return const Center(child: CircularProgressIndicator());
                case MenuStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case MenuStatus.success:
                  if (isMobile) {
                    return TabBarView(
                      children: [
                        for (int weekday = 0;
                            weekday < daysToDisplay;
                            weekday++)
                          MenuTable(
                            weekday: weekday,
                            menu: state.menu,
                          ),
                      ],
                    );
                  } else {
                    return MenuTable(
                      menu: state.menu,
                    );
                  }
                case MenuStatus.failure:
                  return _ErrorWidget(
                    onTap: () => context.read<MenuCubit>().fetchMenu(),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({Key? key, this.onTap}) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Something went wrong!'),
          if (onTap != null)
            TextButton(onPressed: onTap, child: const Text('Try again'))
        ],
      ),
    );
  }
}
