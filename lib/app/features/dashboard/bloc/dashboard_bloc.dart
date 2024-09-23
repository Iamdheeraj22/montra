import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState()) {
    on<ChangeIndex>(_onChangeIndex);
    on<ShowMenu>(_onShowMenu);
  }

  FutureOr<void> _onChangeIndex(
      ChangeIndex event, Emitter<DashboardState> emit) {
    emit(state.copyWith(currentIndex: event.index));
  }

  FutureOr<void> _onShowMenu(ShowMenu event, Emitter<DashboardState> emit) {
    emit(state.copyWith(isMenuShow: !state.isMenuShow));
  }
}
