part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.currentIndex = 0,
    this.isMenuShow = false,
  });
  final int currentIndex;
  final bool isMenuShow;

  HomeState copyWith({
    int? currentIndex,
    bool? isMenuShow,
  }) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      isMenuShow: isMenuShow ?? this.isMenuShow,
    );
  }

  @override
  List<Object> get props => [
        currentIndex,
        isMenuShow,
      ];
}
