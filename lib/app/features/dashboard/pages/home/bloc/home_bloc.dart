import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<ChangeFilterIndex>(_onChangeFilterIndex);
  }

  FutureOr<void> _onChangeFilterIndex(
    ChangeFilterIndex event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(filterIndex: event.index));
  }
}
