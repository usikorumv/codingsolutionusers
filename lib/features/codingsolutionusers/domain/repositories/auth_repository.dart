import 'package:codingsolutionusers/features/codingsolutionusers/domain/entities/auth/users.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/usecases/auth/get_users.dart';
import 'package:dartz/dartz.dart';

import 'package:codingsolutionusers/core/error/failure.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/entities/auth/login.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/entities/auth/register.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/entities/auth/user_info.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/usecases/auth/post_login.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/usecases/auth/post_register.dart';
import 'package:codingsolutionusers/features/codingsolutionusers/domain/usecases/auth/post_user_info.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> login(LoginParams loginParams);

  Future<Either<Failure, Register>> register(RegisterParams registerParams);

  Future<Either<Failure, Users>> users(UsersParams usersParams);

  Future<Either<Failure, UserInfo>> userInfo(UserInfoParams userInfoParams);
}
