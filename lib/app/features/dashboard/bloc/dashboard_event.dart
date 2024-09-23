part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class ChangeIndex extends DashboardEvent {
  const ChangeIndex(this.index);
  final int index;

  @override
  List<Object> get props => [index];
}

class ShowMenu extends DashboardEvent {
  const ShowMenu();

  @override
  List<Object> get props => [];
}
