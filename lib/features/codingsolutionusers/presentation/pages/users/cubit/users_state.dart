part of 'users_cubit.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersEmpty extends UsersState {}

class UsersFailure extends UsersState {
  final String message;

  const UsersFailure(this.message);

  @override
  List<Object> get props => [message];
}

class UsersSuccess extends UsersState {
  final Users users;

  const UsersSuccess(this.users);

  @override
  List<Object> get props => [users];
}
