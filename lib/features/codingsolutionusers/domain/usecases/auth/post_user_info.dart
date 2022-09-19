import 'package:dartz/dartz.dart';

import 'package:codingsolutionusers/core/error/failure.dart';
import 'package:codingsolutionusers/core/usecase/usecase.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/entities/auth/user_info.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/repositories/auth_repository.dart';

class PostUserInfo extends UseCase<UserInfo, UserInfoParams> {
  final AuthRepository _repo;

  PostUserInfo(this._repo);

  @override
  Future<Either<Failure, UserInfo>> call(UserInfoParams params) =>
      _repo.userInfo(params);
}

class UserInfoParams {
  final String name, surname, phone, referer;

  UserInfoParams({
    required this.name,
    required this.surname,
    required this.phone,
    required this.referer,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "phone": phone,
        "referer": referer,
      };
}
