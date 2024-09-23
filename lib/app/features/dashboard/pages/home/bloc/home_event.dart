part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class ChangeFilterIndex extends HomeEvent {
  const ChangeFilterIndex(this.index);
  final int index;

  @override
  List<Object> get props => [index];
}
