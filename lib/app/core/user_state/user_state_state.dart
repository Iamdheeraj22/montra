part of 'user_state_bloc.dart';

class UserStateState extends Equatable {
  final String uid;
  final String email;
  final String name;
  final String userType;

  const UserStateState({
    this.uid = '',
    this.email = '',
    this.name = '',
    this.userType = '',
  });

  UserStateState copyWith({
    String? uid,
    String? email,
    String? name,
    String? userType,
  }) {
    return UserStateState(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      userType: userType ?? this.userType,
    );
  }

  @override
  List<Object?> get props => [
        uid,
        email,
        name,
        userType,
      ];
}
