part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.filterIndex = 0,
  });

  final int filterIndex;

  HomeState copyWith({
    int? currentIndex,
    bool? isMenuShow,
    int? filterIndex,
  }) {
    return HomeState(
      filterIndex: filterIndex ?? this.filterIndex,
    );
  }

  @override
  List<Object> get props => [
        filterIndex,
      ];
}
