import 'package:dartz/dartz.dart';

import 'package:codingsolutionusers/core/error/failure.dart';
import 'package:codingsolutionusers/core/usecase/usecase.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/entities/auth/login.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/repositories/auth_repository.dart';

class PostLogin extends UseCase<Login, LoginParams> {
  final AuthRepository _repo;

  PostLogin(this._repo);

  @override
  Future<Either<Failure, Login>> call(LoginParams params) =>
      _repo.login(params);
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    this.email = "",
    this.password = "",
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
