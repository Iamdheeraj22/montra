part of 'dashboard_bloc.dart';

final class DashboardState extends Equatable {
  final int currentIndex;
  final bool isMenuShow;
  const DashboardState({
    this.currentIndex = 0,
    this.isMenuShow = false,
  });
  DashboardState copyWith({
    int? currentIndex,
    bool? isMenuShow,
  }) {
    return DashboardState(
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
