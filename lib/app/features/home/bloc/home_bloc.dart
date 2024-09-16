import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<ChangeIndex>(_onChangeIndex);
    on<ShowMenu>(_onShowMenu);
  }

  FutureOr<void> _onChangeIndex(
    ChangeIndex event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(currentIndex: event.index));
  }

  FutureOr<void> _onShowMenu(
    ShowMenu event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(isMenuShow: !state.isMenuShow));
  }
}
