import 'package:equatable/equatable.dart';

class Users extends Equatable {
  final List<User> users;
  final int currentPage;
  final int lastPage;

  const Users(this.users, this.currentPage, this.lastPage);

  @override
  List<Object?> get props => [users];
}

class User extends Equatable {
  final String? email;
  final String? name;
  final String? surname;
  final String? referer;
  final String? phone;
  final String? date;

  const User({
    this.email,
    this.name,
    this.surname,
    this.referer,
    this.phone,
    this.date,
  });

  @override
  List<Object?> get props => [];
}
