import 'package:dartz/dartz.dart';

import 'package:codingsolutionusers/core/error/failure.dart';
import 'package:codingsolutionusers/core/usecase/usecase.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/entities/auth/users.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/repositories/auth_repository.dart';

class GetUsers extends UseCase<Users, UsersParams> {
  final AuthRepository _repo;

  GetUsers(this._repo);

  @override
  Future<Either<Failure, Users>> call(UsersParams params) =>
      _repo.users(params);
}

class UsersParams {
  int page;

  UsersParams({this.page = 1});

  Map<String, dynamic> toJson() => {
        "page": page,
      };
}
