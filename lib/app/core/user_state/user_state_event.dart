part of 'user_state_bloc.dart';

@immutable
sealed class UserStateEvent extends Equatable {}

class GetUserDetails extends UserStateEvent {
  GetUserDetails();
  @override
  List<Object?> get props => [];
}
