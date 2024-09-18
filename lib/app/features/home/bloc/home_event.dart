part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class ChangeIndex extends HomeEvent {
  const ChangeIndex(this.index);
  final int index;

  @override
  List<Object> get props => [index];
}

class ShowMenu extends HomeEvent {
  const ShowMenu();

  @override
  List<Object> get props => [];
}

class ChangeFilterIndex extends HomeEvent {
  const ChangeFilterIndex(this.index);
  final int index;

  @override
  List<Object> get props => [index];
}
