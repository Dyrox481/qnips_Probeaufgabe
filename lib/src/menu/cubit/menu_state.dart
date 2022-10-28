part of 'menu_cubit.dart';

enum MenuStatus { initial, loading, success, failure }

extension MenuStatusX on MenuStatus {
  bool get isInitial => this == MenuStatus.initial;
  bool get isLoading => this == MenuStatus.loading;
  bool get isSuccess => this == MenuStatus.success;
  bool get isFailure => this == MenuStatus.failure;
}

class MenuState extends Equatable {
  const MenuState({
    this.status = MenuStatus.initial,
    Menu? menu,
  }) : menu = menu ?? const Menu(allergens: [], products: [], menuRows: []);

  final MenuStatus status;
  final Menu menu;

  MenuState copyWith({
    MenuStatus? status,
    Menu? menu,
  }) {
    return MenuState(
      status: status ?? this.status,
      menu: menu ?? this.menu,
    );
  }

  @override
  List<Object?> get props => [status, menu];
}
