import 'package:dartz/dartz.dart';

import 'package:codingsolutionusers/core/error/failure.dart';
import 'package:codingsolutionusers/core/usecase/usecase.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/entities/auth/register.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/repositories/auth_repository.dart';

class PostRegister extends UseCase<Register, RegisterParams> {
  final AuthRepository _repo;

  PostRegister(this._repo);

  @override
  Future<Either<Failure, Register>> call(RegisterParams params) =>
      _repo.register(params);
}

class RegisterParams {
  final String email;
  final String password;

  RegisterParams({
    this.email = "",
    this.password = "",
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
