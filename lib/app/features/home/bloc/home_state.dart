part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.currentIndex = 0,
    this.isMenuShow = false,
    this.filterIndex = 0,
  });
  final int currentIndex;
  final bool isMenuShow;
  final int filterIndex;

  HomeState copyWith({
    int? currentIndex,
    bool? isMenuShow,
    int? filterIndex,
  }) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      isMenuShow: isMenuShow ?? this.isMenuShow,
      filterIndex: filterIndex ?? this.filterIndex,
    );
  }

  @override
  List<Object> get props => [
        currentIndex,
        isMenuShow,
        filterIndex,
      ];
}
