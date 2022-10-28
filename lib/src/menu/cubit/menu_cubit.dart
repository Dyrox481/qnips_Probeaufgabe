import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_repository/menu_repository.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this._menuRepository) : super(const MenuState());

  final MenuRepository _menuRepository;

  Future<void> fetchMenu() async {
    emit(state.copyWith(status: MenuStatus.loading));

    try {
      final menu = await _menuRepository.getMenu();

      emit(
        state.copyWith(
          status: MenuStatus.success,
          menu: menu,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: MenuStatus.failure));
    }
  }
}
